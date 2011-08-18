module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class RunnerGenerator < Gator::AS3::AS3Generator
          include Gator::Project

          define :command => "runner",
                 :usage => "generate as3 test runner CLASS_NAME", :description => "Creates ASUnit4 suite."
          
          def template_file
            "as3/test/asunit4/suite.as.tt"
          end

          def generate
            @class_name += "Suite"
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