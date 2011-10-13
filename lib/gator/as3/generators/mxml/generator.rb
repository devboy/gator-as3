class Gator
  module MXML
    module WithMXMLTemplates
        def self.included(base)
          base.extend(ClassMethods)
        end

        module ClassMethods
          def template_root
            File.dirname(__FILE__) + "/../templates"
          end
        end
      end
    module ActAsMXMLKlassGenerator
      def target
        File.join(source, Gator::AS3::AS3Util.package_to_dir(@package_name), "#{@class_name}.mxml")
      end
    end
  end
end