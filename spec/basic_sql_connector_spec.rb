# encoding: utf-8
require 'spec_helper'
describe 'ActiveRecord::Base' do

  before(:all) do
    @string_255 = ("1234567890" * 25) + "12345"
    @string_4000 = ("1234567890" * 400)
    @string_8000 = ("1234567890" * 800)
  end

  def execute_plain(clause)
    return ActiveRecord::Base.connection.select_value("SELECT TOP 1 #{clause} FROM [Anlass]")
  end

  def cast(string, type)
    return ActiveRecord::Base.connection.select_value("SELECT CAST('#{string}' AS #{type})")
  end

  def quote(string)
    return ActiveRecord::Base.connection.select_value("SELECT '#{string}'")
  end

  context "when casting strings to various lengths" do

    it "should not cut off a 255 character string when cast to varchar(255)" do
      @string_255.length.should == 255
      cast(@string_255, 'varchar(255)').should == @string_255
    end

    it "should not cut off a 4000 character string when cast to varchar(4000)" do
      @string_4000.length.should == 4000 
      cast(@string_4000, 'varchar(4000)').should == @string_4000
    end

    it "should not cut off a 8000 character string when cast to varchar(8000)" do
      @string_8000.length.should == 8000 
      cast(@string_8000, 'varchar(8000)').should == @string_8000
    end

  end

  context "when just quoting some long strings" do
    it "should not cut off a 255 character string when cast to varchar(255)" do
      quote(@string_255).should == @string_255
    end

    it "should not cut off a 4000 character string" do
      quote(@string_4000).should == @string_4000
    end

    it "should not cut off an 8000 character string" do
      quote(@string_8000).should == @string_8000
    end

  end


  context "when dealing with nullness, emptiness and other not-ness" do

    it "should return an empty string as it was" do
      quote("").should == ""
    end

    it "should return a single space and not trucate it" do
      quote(" ").should == " "
    end

    it "should return the number 0" do
      execute_plain(0).should == 0
    end

    it "should happily concatenate two spaces" do
      execute_plain("CONCAT(' ', ' ')").should == "  "
    end

    it "should successfully concatenate spaces and chars" do
      execute_plain("CONCAT(' ', '0', ' ')").should == " 0 "
    end

    it "should return nil (in Ruby) when asked for NULL (in SQL)" do
      execute_plain("NULL").should ==  nil
    end

    # This is OK according to the default behavior:
    # http://msdn.microsoft.com/en-us/library/hh231515.aspx
    it "should return just the string when using CONCAT() on any string with NULL" do
      execute_plain("CONCAT('1', NULL)").should == "1"
    end

    it "should return Ruby nil for a implicit concatenation of NULL with the string '1'" do
      execute_plain("'1' + NULL").should == nil
    end

    it "should return a string when concatenating a number (as string) with a space" do
      execute_plain("CONCAT('0', ' ')").should ==  "0 "
    end

  end

  context "when handling absurdly large strings" do

    it "should not choke on 100 KB of text" do
      execute_plain("REPLICATE(CAST('1234567890' AS varchar(max)), 100000)").length.should == 1000000
    end

    it "should not choke on 1 MB of text" do
      ActiveRecord::Base.connection.execute("SET textsize 10000000")
      execute_plain("REPLICATE(CAST('1234567890' AS varchar(max)), 1000000)").length.should == 10000000
    end

    it "should not choke on 4 MB of text" do
      ActiveRecord::Base.connection.execute("SET textsize 40000000")
      execute_plain("REPLICATE(CAST('1234567890' AS varchar(max)), 4000000)").length.should == 40000000
    end
  end

  context "when trying out various special characters and accents" do

    it "should be happy with weird-ass special chars" do
      quote("1\\\\2\\2\\n\\\\n").should == "1\\\\2\\2\\n\\\\n"
    end

    it "should return a string with all three types of linebreaks as they originally were (no conversion)" do
      quote("a\na\ra\r\n").should == "a\na\ra\r\n"
    end

    it "should return umlauts properly" do
      quote("äöü").should == 'äöü'
    end

    it "should handle lowercasing accented As" do
      execute_plain("LOWER('ÁÀÂÄÅÃ')").should == 'áàâäåã'
    end

    it "should handle lowercasing accented Es" do
      execute_plain("LOWER('ÉÈÊË')").should == 'éèêë'
    end

    it "should handle lowercasing accented Is" do
      execute_plain("LOWER('ÍÌÎÏ')").should == 'íìîï'
    end

    it "should handle lowercasing accented Os" do
      execute_plain("LOWER('ÓÒÔÖÕØ')").should == 'óòôöõø'
    end

    it "should handle lowercasing accented Us" do
      execute_plain("LOWER('ÚÙÛÜ')").should == 'úùûü'
    end

    it "should handle lowercasing accented Cs" do
      execute_plain("LOWER('Ç')").should == 'ç'
    end

    it "should handle lowercasing accented Ns" do
      execute_plain("LOWER('Ñ')").should == 'ñ'
    end

    it "should handle lowercasing accented Ys" do
      execute_plain("LOWER('Ý')").should == 'ý'
    end
  end

end
