module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class SuiteGenerator < Gator::AS3::TestGenerator
                  include Gator::Project
                  include WithRobotLegsTemplates

          define :command => "suite",
                 :usage => "generate as3 asunit4 test suite CLASS_NAME", :description => "Creates ASUnit4 suite."
          
          def template_file
            "as3/robotlegs/test/asunit4/suite.as.tt"
          end

          def generate
            @class_name += "SuiteTest"
            super
          end

          no_tasks {

            def instance_name
              @class_name.chomp("Test")
            end

           }

        end
      end
    end
  end
end