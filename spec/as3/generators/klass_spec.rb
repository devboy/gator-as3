require File.dirname(__FILE__) + '/../../spec_helper'

describe Gator::AS3::ClassGenerator do

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
      require File.dirname(__FILE__) + "/../../../lib/gator/as3/generators"
      Gator::AS3::ClassGenerator.start("org.devboy.MyShinyClass".split(" "))
      File.exist?(File.join(Gator::Project.project.path(:source, :main, :as3), "org/devboy/MyShinyClass.as")).should == true
    end
    gator.run_with_default_mock
  end

  it "should have the correct values" do
    gator = GatorProcess.new SANDBOX_LOCATION
    gator.should_receive(:fork) do |&block|
      block.call
      require File.dirname(__FILE__) + "/../../../lib/gator/as3/generators"
      generator = Gator::AS3::ClassGenerator.new("org.devboy.MyShinyClass".split(" "))
      generator.invoke_all
      generator.package_name.should == "org.devboy"
      generator.class_name.should == "MyShinyClass"
      generator.template_file.should == "as3/klass.as.tt"

    end
    gator.run_with_default_mock
  end


end