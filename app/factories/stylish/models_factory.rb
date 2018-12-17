require_dependency 'stylish/base_factory'

module Stylish
  class ModelFactory < BaseFactory
    def initialize
      @storage = {
          images: 'Image',
          styles: 'Style'
      }
    end
  end
end
