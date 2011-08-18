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

describe Gator::AS3::ClassGenerator do
  it "should create a template file" do
    gator = GatorProcess.new

    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../lib/gator/as3/generators"
      Gator::AS3::ClassGenerator.start("org.devboy.MyShinyClass".split(" "))
      File.exist?(File.join(Gator::Project.project.path(:source,:main,:as3),"org/devboy/MyShinyClass.as")).should == true
    end

    gator.run
  end
end