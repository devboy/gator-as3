require File.dirname(__FILE__) + '/../../spec_helper'

describe Gator::AS3::GeneratorCollection do

  before(:each) do
    FileUtils.mkdir_p SANDBOX_LOCATION
  end

  after(:each) do
    FileUtils.rm_r(SANDBOX_LOCATION) if File.directory? SANDBOX_LOCATION
  end

  it "should have the correct definition" do
    gator = GatorProcess.new SANDBOX_LOCATION
    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../../lib/gator/as3/generators"
      Gator::AS3::GeneratorCollection.definition[:command].should == "as3"
    end
    gator.run_with_default_mock
  end

  it "should be registered as a subcommand on Gator::GenerateCommand" do
    gator = GatorProcess.new SANDBOX_LOCATION
    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../../lib/gator/as3/generators"
      Gator::GenerateCommand.get_subcommand("as3").should == Gator::AS3::GeneratorCollection
    end
    gator.run_with_default_mock
  end

  it "should have the correct generators registered" do
    gator = GatorProcess.new SANDBOX_LOCATION
    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../../lib/gator/as3/generators"
      Gator::AS3::GeneratorCollection.get_subcommand("klass").should == Gator::AS3::ClassGenerator
      Gator::AS3::GeneratorCollection.get_subcommand("event").should == Gator::AS3::EventGenerator
      Gator::AS3::GeneratorCollection.get_subcommand("interface").should == Gator::AS3::InterfaceGenerator
    end
    gator.run_with_default_mock
  end


end