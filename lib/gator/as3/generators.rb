require File.dirname(__FILE__) + '/utils/as3_util'
require File.dirname(__FILE__) + '/generators/generator'
require File.dirname(__FILE__) + '/generators/collection'

Gator::GenerateCommand.register_subcommand Gator::AS3::GeneratorCollection