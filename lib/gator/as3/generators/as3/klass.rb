require File.dirname(__FILE__) + '/generator'
class Gator
  module AS3
    class ClassGenerator < KlassGenerator

      define :command => "klass",
             :usage => "generate as3 klass CLASS_NAME", :description => "Creates AS3 class."

      def template_file
        "as3/klass.as.tt"
      end

    end
  end
end