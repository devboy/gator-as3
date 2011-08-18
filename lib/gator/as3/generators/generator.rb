module Gator
  module AS3
    class AS3Generator < Gator::Generator
      include Gator::ActAsTemplateGenerator

      argument :package_and_class
      attr_accessor :package_name, :class_name

      def self.template_root
        File.dirname(__FILE__) + "/../templates"
      end

      def init
        @package_name, @class_name = AS3Util.split_package_and_class(package_and_class)
      end

      def generate
        template template_file, target
      end

      protected

      def template_file
        nil
      end

      def target
        File.join(source, AS3Util.package_to_dir(@package_name), "#{@class_name}.as")
      end

    end

    class KlassGenerator < AS3Generator

      class_option :test, :default => false

      def generate_test
        return unless options[:test]
        invoke resolve_subcommand(generate_test_command, generate_test_command_fallback)
      end

      protected

      def source
        project.path(:source, :main, :as3)
      end

      def generate_test_command
        ["test", definition[:command]]
      end

      def generate_test_command_fallback
        ["as3", "test", "klass"]
      end
    end

    class TestGenerator < AS3Generator

      class_option :klass, :default => false

      def generate_klass
        return unless options[:klass]
        invoke resolve_subcommand(generate_klass_command, generate_klass_command_fallback)
      end

      class_option :suite, :default => true

      def update_suite
        return unless options[:suite]
        invoke resolve_subcommand(["test","suite"])
      end

      class_option :runner, :default => true

      def update_runner
        return unless options[:runner]
        invoke resolve_subcommand(["test","runner"])
      end

      protected

      def source
        Gator::Project.project.path(:source, :test, :as3)
      end

      def generate_klass_command
        ["as3", definition[:command]]
      end

      def generate_klass_command_fallback
        ["as3", "klass"]
      end
    end
  end
end