# encoding: utf-8
require 'spec_helper'
describe 'ActiveRecord::Base' do

  def execute_plain(clause)
    return ActiveRecord::Base.connection.select_value("SELECT TOP 1 #{clause} FROM [Anlass]")
  end

  def cast(string, type)
    return ActiveRecord::Base.connection.select_value("SELECT CAST('#{string}' AS #{type})")
  end

  def quote(string)
    return ActiveRecord::Base.connection.select_value("SELECT '#{string}'")
  end

  context "when casting strings to various lengths and stuff" do

    it "should not cut off a 255 character string when cast to varchar(255)" do
      string = ("1234567890" * 25) + "12345"
      string.length.should == 255
      cast(string, 'varchar(255)').should == string
    end

    it "should not cut off a 4000 character string when cast to varchar(4000)" do
      string = ("1234567890" * 400)
      string.length.should == 4000 
      cast(string, 'varchar(4000)').should == string
    end

  end

  context "when just quoting some long strings" do
    it "should not cut off a 4000 character string" do
      string = ("1234567890" * 400)
      string.length.should == 4000 
      quote(string).should == string
    end

  end

  it "should return 'áàâäåã' in response to LOWER('ÁÀÂÄÅÃ')" do
    execute_plain("LOWER('ÁÀÂÄÅÃ')").should == 'áàâäåã'
  end

end
