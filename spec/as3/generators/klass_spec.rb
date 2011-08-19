require File.dirname(__FILE__) + '/../../spec_helper'

TEST_SANDBOX = File.join( SANDBOX_LOCATION, "ClassGeneratorSpec" )

describe Gator::AS3::ClassGenerator do

  before(:each) do
    #system "rm -R TEST_SANDBOX" if File.directory? TEST_SANDBOX
    FileUtils.mkdir_p TEST_SANDBOX
  end

  after(:each) do
    p "sould delete dir"
    FileUtils.rm_r(TEST_SANDBOX) if File.directory? TEST_SANDBOX
    p getwd
  end

  it "should create a file in the correct location" do

    gator = GatorProcess.new  TEST_SANDBOX
    gator.should_receive(:fork) do |&block|
      block.call
      #p Gator::Util.find_gator_project
      require File.dirname(__FILE__) + "/../../../lib/gator/as3/generators"
      Gator::AS3::ClassGenerator.start("org.devboy.MyShinyClass".split(" "))
      File.exist?(File.join(Gator::Project.project.path(:source,:main,:as3),"org/devboy/MyShinyClass.as")).should == true
    end
    gator.run_with_default_mock

  end

  it "should create a file with the correct content"


end