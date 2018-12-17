module Stylish
  class MakeDefaultService < Stylish::BaseService
    private

    def execute!
      return false if @object.default?

      @object.default = true
      @object.class.where(category: @object.category, default: true).update_all(default: false)
      @object.save
    end
  end
end
