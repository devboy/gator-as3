module Gator
  module AS3
    class InterfaceGenerator < KlassGenerator
      include Gator::Project

      define :command => "interface",
             :usage => "generate as3 interface CLASS_NAME", :description => "Creates AS3 class."

      def template_file
        "as3/interface.as.tt"
      end

    end
  end
end