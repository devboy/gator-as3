require File.dirname(__FILE__) + '/component'
require File.dirname(__FILE__) + '/application'
require File.dirname(__FILE__) + '/skin'

class Gator
  module MXML

    class GeneratorCollection < Gator::Command

      define :command => "mxml",
             :usage => "generate mxml GENERATOR", :description => "Generators for MXML."

      register_subcommand Gator::MXML::ComponentGenerator
      register_subcommand Gator::MXML::ApplicationGenerator
      register_subcommand Gator::MXML::SkinGenerator
      
    end

  end
end