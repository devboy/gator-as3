require File.dirname(__FILE__) + '/component'

module Gator
  module MXML

    class GeneratorCollection < Gator::Command

      define :command => "mxml",
             :usage => "generate mxml GENERATOR", :description => "Generators for MXML."

      register_subcommand Gator::MXML::ComponentGenerator

    end

  end
end