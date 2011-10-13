class Gator
  class AS3Configuration < Gator::Configuration

    def use generator
      case generator
        when :as3
        when :mxml
        when :asunit3
        when :asunit4
        when :flexunit4
      end
    end

  end
end