require "rubygems"
require "cucumber"
require "spec/rake/spectask"
require "cucumber/rake/task"

desc "Run full tests"
task :default => [:spec, :features]

desc "Run all specs"
Spec::Rake::SpecTask.new("spec") do |t|
  t.spec_files = FileList["spec/**/*.rb"]
end

desc "Run all features"
task :features => %w(features:complete features:wip)

namespace :features do
  desc "Run work-in-progress features"
  Cucumber::Rake::Task.new(:wip) do |t|
    t.cucumber_opts = "features --tag @wip --wip --format progress"
  end

  desc "Run complete features"
  Cucumber::Rake::Task.new(:complete) do |t|
    t.cucumber_opts = "features --tag ~@wip --format progress"
  end
end
