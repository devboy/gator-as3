require File.dirname(__FILE__) + '/../../../spec_helper'

describe "Gator::AS3::ClassGenerator" do

  before :all do
    @process = GatorProcess.new SANDBOX_LOCATION
  end

  it "should have the correct command name" do

    @process.should_receive :fork do |&block|
      block.call
      Gator::Sandbox.gator.as3.use :as3
      Gator::AS3::ClassGenerator.definition[:command].should == "klass"
    end
    @process.run_with_default_mock

  end

  it "should have the correct template path" do

    @process.should_receive :fork do |&block|
      block.call
      Gator::Sandbox.gator.as3.use :as3
      Gator::AS3::ClassGenerator.new.template_file == "as3/klass.as.tt"
    end
    @process.run_with_default_mock

  end

end