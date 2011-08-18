module Gator
  module AS3
    module ASUnit4

      class RunnerGenerator < Gator::AS3::AS3Generator
        include Gator::Project

        define :command => "runner",
               :usage => "generate as3 test runner CLASS_NAME", :description => "Creates ASUnit4 runner."

        class_option :force, :default => true

        def source
          project.path(:source, :test, :as3)
        end

        def template_file
          "as3/test/asunit4/runner.as.tt"
        end

        def generate
          @package_name = ""
          @class_name = "ASUnit4Runner"
          super
        end

      end
    end
  end
end