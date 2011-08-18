require File.dirname(__FILE__) + '/klass'
require File.dirname(__FILE__) + '/suite'
require File.dirname(__FILE__) + '/runner'

module Gator
  module AS3
    module ASUnit4

      class TestGeneratorCollection < Gator::Command

        define :command => "test",
               :usage => "generate as3 test GENERATOR", :description => "TestGenerators for ASUnit4"

        register_subcommand ClassTestGenerator
        register_subcommand SuiteGenerator
        register_subcommand RunnerGenerator

      end
    end
  end
end