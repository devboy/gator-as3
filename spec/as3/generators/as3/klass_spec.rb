require File.dirname(__FILE__) + '/../../../spec_helper'

describe "Gator::AS3::ClassGenerator" do

  it "should have the correct command name" do
    Gator::AS3::ClassGenerator.definition[:command].should == "klass"
  end

  it "should have the correct template path" do
    Gator::AS3::ClassGenerator.new.template_file == "as3/klass.as.tt"
  end

end