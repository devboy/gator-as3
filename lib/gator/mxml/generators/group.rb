module Gator
  module MXML
    class GroupGenerator < Gator::AS3::KlassGenerator
      include Gator::Project
      include WithMXMLTemplates
      include ActAsMXMLKlassGenerator

      define :command => "group",
             :usage => "generate mxml group CLASS_NAME", :description => "Creates mxml group."

      def template_file
        "mxml/group.mxml.tt"
      end

    end
  end
end