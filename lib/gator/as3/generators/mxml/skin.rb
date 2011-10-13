class Gator
  module MXML
    class SkinGenerator < Gator::AS3::KlassGenerator
      include Gator::Project
      include WithMXMLTemplates
      include ActAsMXMLKlassGenerator

      define :command => "skin",
             :usage => "generate spark skin CLASS_NAME", :description => "Creates spark skin."

      def template_file
        "mxml/skin.mxml.tt"
      end
      
      def generate
        @class_name = "#{@class_name}Skin"
        super
      end

    end
  end
end