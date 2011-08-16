require File.dirname(__FILE__) + '/generators/as3_class_file_generator'
require File.dirname(__FILE__) + '/generators/as3_test_file_generator'
require File.dirname(__FILE__) + '/generators/collection'

Gator::GenerateCommand.register_subcommand Gator::AS3::GeneratorCollection