namespace :madras do
  task :benchmark do
    benchmark(ENV['POOL_SIZE'] || 1, ENV['SECONDS'] || 2)
  end
end


require 'timeout'
def benchmark(pool_size = 1, seconds = 2)
  puts "Running with a pool size of #{pool_size} for #{seconds} seconds."
  config = YAML::load_file(File.join(Rails.root, "config", "database.yml"))
  config[Rails.env]["pool"] = pool_size
  ActiveRecord::Base.establish_connection(config[Rails.env])

  threads = []
  thread_reqs = {}
  Thread.abort_on_exception = true
  puts "Creating #{pool_size} threads"
  1.upto(pool_size.to_i).each do |number|
    thread = Thread.new do
      thread_reqs[number] = 0
      while true do
        begin
          ActiveRecord::Base.connection_pool.with_connection {|conn|
            #conn.select_value("SELECT TOP 1 IDAnlass from Anlass")
            conn.select_value("SELECT TOP 10 PersonVorname, count(PersonVorname) FROM dbo.tblPerson GROUP BY PersonVorname")
          }
          thread_reqs[number] += 1
        rescue Exception => e
          puts "Rescued #{e}"
        end
      end
    end
    threads << thread
  end

  #binding.pry
  #threads.each_with_index do |t, i|
  #  puts "Starting thread #{i + 1}"
  #  binding.pry
  #end

  sleep(seconds.to_i)

  total_requests = 0
  thread_reqs.each do |reqs|
    puts "Thread #{reqs[0]} did #{reqs[1]} requests"
    total_requests += reqs[1]
    puts "---"
  end

  puts "Pool size: #{pool_size}"
  puts "Requests in #{seconds} secs: #{total_requests}"
  puts "Requests per second: #{total_requests.to_f / seconds.to_f}"
end
