module Gator
  module AS3
    class GeneratorBase < Gator::Task

      argument :package_and_class

      attr_accessor :package_name, :class_name

      def init
        source_paths.unshift File.dirname(__FILE__) + '/../templates'
        @package_name, @class_name = split_package_and_class(package_and_class)
      end

      def generate
        template template_file, target
      end

      protected

      def template_file
        nil
      end

      def target
        File.join(source, package_to_dir, "#{@class_name}.as")
      end

      def definition
        self.class.definition
      end

      def split_package_and_class(class_name)
        pieces = class_name.split "."
        class_name = pieces.pop
        package_name = pieces.join "."
        return package_name, class_name
      end

      def package_to_dir
        @package_name.split(".").join(File::SEPARATOR)
      end

    end

    class KlassGenerator < GeneratorBase
      include Gator::Project

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

    class TestGenerator < GeneratorBase
      include Gator::Project

      class_option :klass, :default => false

      def generate_klass
        return unless options[:klass]
        invoke resolve_subcommand(generate_klass_command, generate_klass_command_fallback)
      end

      protected

      def source
        project.path(:source, :test, :as3)
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