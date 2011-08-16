module Gator
  module AS3
    class AS3ClassFileGenerator < Gator::Task
      argument :classname
      class_option :test, :default => false

      def generate_test
        return unless options[:test]
        invoke resolve_subcommand(["test", definition[:command]],["as3","test","klass"])
      end

      no_tasks {


        def package_name
          @package_name ||= split_package_class_name(classname)[0]
        end

        def package_name=(name)
          @package_name = name
        end

        def class_name
          @class_name ||= split_package_class_name(classname)[1]
        end

        def class_name=(name)
          @class_name=name
        end

      }

      protected

      def definition
        self.class.definition
      end

      def split_package_class_name(class_name)
        pieces = class_name.split "."
        class_name = pieces.pop
        package_name = pieces.join "."
        return package_name, class_name
      end

    end
  end
end
