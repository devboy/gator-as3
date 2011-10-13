class Gator
  module AS3
    module ASUnit3

      class RunnerGenerator < Gator::AS3::AS3Generator
        include Gator::Project

        define :command => "runner",
               :usage => "generate as3 asunit3 test runner CLASS_NAME", :description => "Creates ASUnit3 runner."

        def source
          project.path(:source, :test, :as3)
        end

        def template_file
          "as3/test/asunit3/runner.as.tt"
        end

        def generate
          @package_name = ""
          @class_name = "ASUnit3Runner"
          super
        end

      end
    end
  end
end