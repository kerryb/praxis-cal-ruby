require File.expand_path(File.dirname(__FILE__) + '/../lib/calendar.rb')

When /^I run "cal ([^\"]*)"$/ do |args|
  @output = Calendar.new(args).run
end

Then /^I should see:$/ do |string|
  @output.should == string
end
