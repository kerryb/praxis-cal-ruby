require "spec"
$:.unshift(File.dirname(__FILE__) + "/../lib")
require "calendar"

describe Calendar do
  describe "displaying a specific month and year" do
    it "shows the month and year in the first line" do
      Calendar.new(%w(11 1969)).output.split("\n").first.should == "   November 1969"
    end
  end
end
