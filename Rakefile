# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

def version
  @version ||= File.read("lib/#{name}.rb")[/^\s*VERSION\s*=\s*['"](?'version'\d+\.\d+\.\d+)['"]/,
    'version']
end

Rake::TestTask.new(:test)

task default: :test
