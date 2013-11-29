# encoding: utf-8
require 'spec_helper'
describe 'ActiveRecord::Base' do

  def execute_plain(clause)
    return ActiveRecord::Base.connection.select_value("SELECT TOP 1 #{clause} FROM [Anlass]")
  end

  def cast(string, type)
    return ActiveRecord::Base.connection.select_value("CAST('#{string}' AS #{type})")
  end

  it "casting a 255 character string to varchar(255) should not cut it off" do
    string = ("1234567890" * 25) + "12345"
    string.length.should == 255
    cast(string, 'varchar(255)').should == string
  end

  it "should return 'áàâäåã' in response to LOWER('ÁÀÂÄÅÃ')" do
    execute_plain("LOWER('ÁÀÂÄÅÃ')").should == 'áàâäåã'
  end

end
