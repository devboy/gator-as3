class Gator
  class AS3Configuration < Gator::Configuration

    def use *generators
      require File.dirname(__FILE__) + '/../../gator/utils/as3_util'
      generators.each do |generator|
        case generator
        when :as3
          add_as3_collection
        when :mxml
          require File.dirname(__FILE__) + '/generators/mxml/generator'
          require File.dirname(__FILE__) + '/generators/mxml/collection'
          Gator::GenerateCommand << Gator::MXML::GeneratorCollection
        when :asunit3
          add_as3_collection
          require File.dirname(__FILE__) + '/generators/as3/test/asunit3'
        when :asunit4
          add_as3_collection
          require File.dirname(__FILE__) + '/generators/as3/test/asunit4'
        when :flexunit4
          add_as3_collection
          require File.dirname(__FILE__) + '/generators/as3/test/flexunit4'
        end
      end
    end

    private

    def add_as3_collection
      unless @as3_collection_added
        require File.dirname(__FILE__) + '/generators/as3/collection'
        require File.dirname(__FILE__) + '/generators/as3/generator'
        Gator::GenerateCommand << Gator::AS3::GeneratorCollection
         @as3_collection_added = true
      end
    end
  end
end