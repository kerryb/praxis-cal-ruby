When /^I run "cal ([^\"]*)"$/ do |args|
  ARGV.clear
  ARGV.concat args.split
  orig_stdout = $stdout
  $stdout = stdout_capture = StringIO.new
  load File.expand_path(File.dirname(__FILE__) + "/../bin/cal")
  $stdout = orig_stdout
  @output = stdout_capture.string
end

Then /^I should see:$/ do |string|
  @output.chomp.should == string
end
