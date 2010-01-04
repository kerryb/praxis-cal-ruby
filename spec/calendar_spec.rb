require "spec"
$:.unshift(File.dirname(__FILE__) + "/../lib")
require "calendar"

describe Calendar do
  describe "displaying a specific month and year" do
    def get_calendar month, year
      Calendar.new([month, year]).output
    end

    it "shows the month and year in the first line" do
      get_calendar(11, 1969).split("\n").first.should == "   November 1969"
    end

    it "displays the days-of-the-week headers" do
      get_calendar(11, 1969).split("\n")[1].should == "Su Mo Tu We Th Fr Sa"
    end
  end
end
