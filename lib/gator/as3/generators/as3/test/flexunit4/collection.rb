require File.dirname(__FILE__) + '/klass'

class Gator
  module AS3
    module FlexUnit4

      class TestGeneratorCollection < Gator::Command

        define :command => "test",
               :usage => "generate as3 test GENERATOR", :description => "TestGenerators for FlexUnit4"

        register_subcommand ClassTestGenerator

      end
    end
  end
end