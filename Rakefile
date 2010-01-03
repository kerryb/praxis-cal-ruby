require 'rubygems'
require 'cucumber'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

desc "Run full tests"
task :default => [:spec, :features]

desc "Run all specs"
Spec::Rake::SpecTask.new("spec") do |t|
  t.spec_files = FileList["spec/**/*.rb"]
end

desc 'Run all features'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format progress'
end
