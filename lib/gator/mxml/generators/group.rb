module Gator
  module MXML
    class GroupGenerator < KlassGenerator
      include Gator::Project

      define :command => "group",
             :usage => "generate mxml group CLASS_NAME", :description => "Creates mxml group."

      def template_file
        "mxml/group.mxml.tt"
      end

    end
  end
end