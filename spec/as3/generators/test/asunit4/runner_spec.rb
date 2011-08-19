require File.dirname(__FILE__) + '/../../../../spec_helper'
require File.dirname(__FILE__) + "/../../../../../lib/gator/as3/generators/test/asunit4"

describe Gator::AS3::ASUnit4::RunnerGenerator do

  before(:each) do
    FileUtils.mkdir_p SANDBOX_LOCATION
  end

  after(:each) do
    FileUtils.rm_r(SANDBOX_LOCATION) if File.directory? SANDBOX_LOCATION
  end

  it "should create a file in the correct location" do
    gator = GatorProcess.new SANDBOX_LOCATION
    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../../../../lib/gator/as3/generators"
      require File.dirname(__FILE__) + "/../../../../../lib/gator/as3/generators/test/asunit4"
      Gator::AS3::ASUnit4::RunnerGenerator.start("org.devboy.MyShinyClass".split(" "))
      File.exist?(File.join(Gator::Project.project.path(:source, :test, :as3), "ASUnit4Runner.as")).should == true
    end
    gator.run_with_default_mock
  end

  it "should have the correct values" do
    gator = GatorProcess.new SANDBOX_LOCATION
    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../../../../lib/gator/as3/generators"
    require File.dirname(__FILE__) + "/../../../../../lib/gator/as3/generators/test/asunit4"
      generator = Gator::AS3::ASUnit4::RunnerGenerator.new("org.devboy.MyShinyClass".split(" "))
      generator.invoke_all
      generator.package_name.should == ""
      generator.class_name.should == "ASUnit4Runner"
      generator.template_file.should == "as3/test/asunit4/runner.as.tt"

    end
    gator.run_with_default_mock
  end


end