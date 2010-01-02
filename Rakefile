require 'rubygems'
require 'cucumber'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

desc 'Run full tests'
task :default => [:examples, :features]

desc 'Run all examples'
Spec::Rake::SpecTask.new('examples') do |t|
  t.spec_files = FileList['examples/**/*.rb']
end

desc 'Run all features'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format progress'
end
