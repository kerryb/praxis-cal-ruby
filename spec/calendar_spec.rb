require "spec"
require "chronic"

$:.unshift(File.dirname(__FILE__) + "/../lib")
require "calendar"

describe Calendar do
  def get_calendar_rows *args
    Calendar.new(args).output.split("\n")
  end

  describe "displaying a specific month and year" do
    it "shows the month and year in the first line" do
      get_calendar_rows(11, 1969).first.should == "   November 1969"
    end

    it "displays the days-of-the-week headers" do
      get_calendar_rows(11, 1969)[1].should == "Su Mo Tu We Th Fr Sa"
    end

    describe "when the first of the month is a Sunday" do
      it "displays the dates starting with 1 in the first column" do
        get_calendar_rows(8, 2010)[2..-1].should == [
          " 1  2  3  4  5  6  7",
          " 8  9 10 11 12 13 14",
          "15 16 17 18 19 20 21",
          "22 23 24 25 26 27 28",
          "29 30 31"
        ]
      end
    end

    describe "when the first of the month is not a Sunday" do
      it "displays the dates starting with 1 in the correct column" do
        get_calendar_rows(1, 2010)[2..-1].should == [
          "                1  2",
          " 3  4  5  6  7  8  9",
          "10 11 12 13 14 15 16",
          "17 18 19 20 21 22 23",
          "24 25 26 27 28 29 30",
          "31"
        ]
      end
    end
  end

  describe "with no arguments" do
    before do
      Time.stub(:now).and_return Chronic.parse("17 November 1969")
    end

    it "displays the current month" do
      get_calendar_rows.should == [
        "   November 1969",
        "Su Mo Tu We Th Fr Sa",
        "                   1",
        " 2  3  4  5  6  7  8",
        " 9 10 11 12 13 14 15",
        "16 17 18 19 20 21 22",
        "23 24 25 26 27 28 29",
        "30"
      ]
    end
  end
end
