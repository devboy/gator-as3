class Gator
  module AS3
    module ASUnit3

      class SuiteGenerator < Gator::AS3::AS3Generator
        include Gator::Project

        define :command => "suite",
               :usage => "generate as3 asunit3 test suite CLASS_NAME", :description => "Creates ASUnit3 suite."

        def source
          project.path(:source, :test, :as3)
        end

        def template_file
          "as3/test/asunit3/suite.as.tt"
        end

        def generate
          @package_name = ""
          @class_name = "AllTests"
          super
        end

        no_tasks {

          def all_tests
            @all_test ||= AS3Util.find_test_files(source, "").collect do |file|
              AS3Util.file_to_package_and_class(file, source)
            end
          end

        }

      end
    end
  end
end