require File.expand_path(File.dirname(__FILE__) + '/../lib/calendar.rb')

When /^I run "cal ([^\"]*)"$/ do |args|
  ARGV.clear << args.split
  orig_stdout = $stdout
  $stdout = stdout_capture = StringIO.new
  load File.expand_path(File.dirname(__FILE__) + '/../bin/cal')
  $stdout = orig_stdout
  @output = stdout_capture.string
end

Then /^I should see:$/ do |string|
  @output.should == string
end
