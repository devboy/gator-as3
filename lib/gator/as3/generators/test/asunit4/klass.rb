module Gator
  module AS3
    module ASUnit4

      class ClassTestGenerator < Gator::AS3::TestGenerator
        include Gator::Project

        define :command => "klass",
               :usage => "generate as3 test klass CLASS_NAME", :description => "Creates ASUnit4 class test."

        def self.source_root
          File.dirname __FILE__
        end

        def generate
          @class_name = "#{@class_name}Test"
          src = project.path(:source, :test, :as3)
          src = File.join(src, @package_name.split(".").join(File::SEPARATOR)) unless @package_name == ""
          template "klass.as.tt", File.join(src, "#{@class_name}.as")
        end

        no_tasks {

          def instance_name
            class_name.chomp("Test")
          end

        }

      end

    end
  end
end