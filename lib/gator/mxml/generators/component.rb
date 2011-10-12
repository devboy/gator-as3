class Gator
  module MXML
    class ComponentGenerator < Gator::AS3::KlassGenerator
      include Gator::Project
      include WithMXMLTemplates
      include ActAsMXMLKlassGenerator

      define :command => "component", :short => "comp",
             :usage => "generate mxml component CLASS_NAME", :description => "Creates mxml component based on group."

      def template_file
        "mxml/component.mxml.tt"
      end

    end
  end
end