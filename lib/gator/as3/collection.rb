require File.dirname(__FILE__) + '/klass'

module Gator
  module AS3

    class GeneratorCollection < Gator::Command

      define :command => "as3",
             :usage => "generate as3 GENERATOR", :description => "Generators for AS3."

      register_subcommand Gator::AS3::ClassGenerator

    end

  end
end