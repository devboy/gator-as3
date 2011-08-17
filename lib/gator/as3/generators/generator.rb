module Gator
  module AS3
    class GeneratorBase < Gator::Task

      argument :package_and_class

      no_tasks {

        def package_name
          @package_name ||= split_package_and_class(package_and_class)[0]
        end

        def package_name=(name)
          @package_name = name
        end

        def class_name
          @class_name ||= split_package_and_class(package_and_class)[1]
        end

        def class_name=(name)
          @class_name=name
        end

      }

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
        invoke resolve_subcommand(test_command,test_command_fallback)
      end

      protected

      def test_command
        ["test", definition[:command]]
      end

      def test_command_fallback
        ["as3","test","klass"]
      end
    end

    class TestGenerator < GeneratorBase
      class_option :klass, :default => false

      def generate_klass
        return unless options[:klass]
        p resolve_subcommand(klass_command,klass_command_fallback)
        invoke resolve_subcommand(klass_command,klass_command_fallback)
      end

      def klass_command
        ["as3", definition[:command]]
      end

      def klass_command_fallback
        ["as3","klass"]
      end
    end
  end
end