class Gator
  module MXML
    class ApplicationGenerator < Gator::AS3::KlassGenerator
      include Gator::Project
      include WithMXMLTemplates
      include ActAsMXMLKlassGenerator

      define :command => "application", :short => "app",
             :usage => "generate mxml application CLASS_NAME", :description => "Creates mxml application."

      def template_file
        "mxml/application.mxml.tt"
      end

    end
  end
end