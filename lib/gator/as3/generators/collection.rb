require File.dirname(__FILE__) + '/klass'
require File.dirname(__FILE__) + '/event'
require File.dirname(__FILE__) + '/interface'

module Gator
  module AS3

    class GeneratorCollection < Gator::Command

      define :command => "as3",
             :usage => "generate as3 GENERATOR", :description => "Generators for AS3."

      register_subcommand Gator::AS3::ClassGenerator
      register_subcommand Gator::AS3::EventGenerator
      register_subcommand Gator::AS3::InterfaceGenerator

    end

  end
end