module Gator
  module AS3
    class GeneratorBase < Gator::Task

      argument :package_and_class

      attr_accessor :package_name, :class_name

      def init
        @package_name, @class_name = split_package_and_class(package_and_class)
      end

      protected

      def definition
        self.class.definition
      end

      def split_package_and_class(class_name)
        pieces = class_name.split "."
        class_name = pieces.pop
        package_name = pieces.join "."
        return package_name, class_name
      end

    end

    class KlassGenerator < GeneratorBase
      class_option :test, :default => false

      def generate_test
        return unless options[:test]
        invoke resolve_subcommand(generate_test_command,generate_test_command_fallback)
      end

      protected

      def generate_test_command
        ["test", definition[:command]]
      end

      def generate_test_command_fallback
        ["as3","test","klass"]
      end
    end

    class TestGenerator < GeneratorBase
      class_option :klass, :default => false

      def generate_klass
        return unless options[:klass]
        invoke resolve_subcommand(generate_klass_command,generate_klass_command_fallback)
      end

      protected

      def generate_klass_command
        ["as3", definition[:command]]
      end

      def generate_klass_command_fallback
        ["as3","klass"]
      end
    end
  end
end