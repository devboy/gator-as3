module Gator
  module AS3
    class AS3TestFileGenerator < Gator::Task
      argument :classname
      class_option :impl, :default => false

      def generate_implementation
        return unless options[:impl]
        invoke resolve_subcommand(["as3", definition[:command]],["as3","klass"])
      end

      no_tasks {

        attr_writer :package_name, :class_name

        def package_name
          @package_name ||= split_package_class_name(classname)[0]
        end

        def class_name
          @class_name ||= split_package_class_name(classname)[1]
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
