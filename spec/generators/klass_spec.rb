require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class GatorProcess
  def run
    fork do
      Dir.chdir "/Users/devboy/Development/Source/Ruby/gator-as3-testproject"
      require "gator"
      Gator::Util.initialize_files
    end
  end
end

describe "gator" do
  it "should run in a different thread" do
    gator = GatorProcess.new

    gator.should_receive(:fork) do |&block|
      block.call
      Gator::Runner.resolve_subcommand("generate").should == Gator::GenerateCommand
    end

    gator.run
  end
end

describe Gator::AS3::ClassGenerator do
  it "should have some tests"
end