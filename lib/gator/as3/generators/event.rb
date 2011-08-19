module Gator
  module AS3
    class EventGenerator < KlassGenerator
      include Gator::Project

      define :command => "event",
             :usage => "generate as3 event CLASS_NAME", :description => "Creates AS3 event."

      def template_file
        "as3/event.as.tt"
      end

    end
  end
end