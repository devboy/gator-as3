module Gator
  module AS3
    class ClassGenerator < KlassGenerator
      include Gator::Project

      define :command => "klass",
             :usage => "generate as3 klass CLASS_NAME", :description => "Creates AS3 class."

      def template_file
        "as3/klass.as.tt"
      end

    end
  end
end