unless defined?(SpecHelpers)

  require 'simplecov'
  require 'simplecov-rcov'

  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.root(File.dirname(__FILE__) + '/../')
  SimpleCov.coverage_dir(File.join("test", "coverage"))
  SimpleCov.start

  require File.dirname(__FILE__)+'/../lib/gator/as3'

  RSpec.configure do |config|
  end

  SANDBOX_LOCATION = File.dirname(__FILE__) + "/sandbox/specs"

  class GatorProcess

    def initialize(dir)
      @dir = dir
    end

    def run_fork_only
      fork do
      end
    end

    def run_with_default_mock
      fork do
        require "gator"
      end
    end

  end

end