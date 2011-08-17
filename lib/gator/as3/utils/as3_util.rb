module Gator
  module AS3
    class AS3Util
      class << self
        def find_test_files( test_source, package_name )
          Dir["#{File.join(test_source,package_to_dir(package_name))}/**/*Test.as"]
        end

        def package_to_dir(package)
          package.split(".").join(File::SEPARATOR)
        end
      end
    end
  end
end
