require File.dirname(__FILE__) + '/klass'
require File.dirname(__FILE__) + '/suite'
require File.dirname(__FILE__) + '/runner'

class Gator
  module AS3
    module ASUnit3

      class TestGeneratorCollection < Gator::Command

        define :command => "test",
               :usage => "generate as3 test GENERATOR", :description => "TestGenerators for ASUnit3"

        register_subcommand ClassTestGenerator
        register_subcommand SuiteGenerator
        register_subcommand RunnerGenerator

      end
    end
  end
end