require_dependency 'stylish/base_factory'

module Stylish
  class ServiceFactory < Stylish::BaseFactory
    def initialize
      @storage = {
          active: 'ActivateService',
          default: 'MakeDefaultService'
      }
    end
  end
end
