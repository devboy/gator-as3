module Gator
  module AS3
    class ClassGenerator < KlassGenerator
      include Gator::Project

      define :command => "klass",
             :usage => "generate as3 klass CLASS_NAME", :description => "Creates AS3 class."

      def self.source_root
        File.dirname __FILE__
      end

      def template_file
        "klass.as.tt"
      end

    end
  end
end