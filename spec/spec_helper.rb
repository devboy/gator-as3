$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'thor'
require 'gator'
require 'fileutils'
require File.dirname(__FILE__) + '/../lib/gator/as3/generators'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|

end

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
      Gator::Util.stub!(:find_gator_project).and_return(@dir)
      Gator::Project.project=Gator::Project::ProjectBase.new
      Gator::Project.project.name = "gator-as3-testproject"
      Gator::Project.project.options[:authors] = ["devboy"]
    end
  end

end

SANDBOX_LOCATION = File.dirname(__FILE__) + "/sandbox/specs"
