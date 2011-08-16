module Gator
  module AS3
    class ClassGenerator < AS3ClassFileGenerator
      include Gator::Project

      define :command => "klass",
             :usage => "generate as3 klass CLASS_NAME", :description => "Creates AS3 class."

      def self.source_root
        File.dirname __FILE__
      end

      def generate
        src = project.path(:source, :main, :as3)
        src = File.join(src, package_name.split(".").join(File::SEPARATOR)) unless package_name == ""
        template "klass.as.tt", File.join(src, "#{class_name}.as")
      end

    end
  end
end