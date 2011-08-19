module Gator
  module AS3
    class AS3Util
      class << self
        def find_test_files( source, package_name="" )
          Dir["#{File.join(source,package_to_dir(package_name))}**/*Test.as"]
        end

        def package_to_dir(package)
          package.split(".").join(File::SEPARATOR)
        end

        def file_to_package_and_class(file,source=nil)
          file.gsub!(source+"/","") if source
          class_name = File.basename(file,".as")
          package_name = file.split(File::SEPARATOR).join(".").chomp("#{class_name}.as").chomp(".")
          return :class_name => class_name, :package_name => package_name
        end

        def split_package_and_class(class_name)
          pieces = class_name.split "."
          class_name = pieces.pop
          package_name = pieces.join "."
          return package_name, class_name
        end
        
        # Taken from https://github.com/lukebayes/project-sprouts/blob/master/lib/sprout/string.rb
        # "FooBar".snake_case #=> "foo_bar"
        def snake_case
         gsub(/\B[A-Z]/, '_\&').downcase
        end

        # "foo_bar".camel_case #=> "FooBar"
        def camel_case
         str = gsub(/^[a-z]|_+[a-z]/) { |a| a.upcase }
         str.gsub(/_/, '')
        end

        def dash_case
         self.snake_case.gsub('_', '-')
        end
      end
    end
  end
end
