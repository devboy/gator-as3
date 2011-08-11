require File.dirname(__FILE__) + '/klass'

module Gator
  module AS3
    module ASUnit4

      class TestGeneratorCollection < Gator::Command

        define :command => "test",
               :usage => "generate as3 test GENERATOR", :description => "TestGenerators for ASUnit4"

        register_subcommand ClassTestGenerator

      end
    end
  end
end