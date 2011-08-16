module Gator
  module AS3
    class AS3TestFileGenerator < Gator::Task
      argument :classname
      class_option :test, :default => false
    end
  end
end
