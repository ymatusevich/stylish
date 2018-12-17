module Stylish
  class ActivateService < Stylish::BaseService
    private

    def execute!
      return false if @object.active?

      @object.active = true
      @object.class.where(category: @object.category, active: true).update_all(active: false)
      @object.save
    end
  end
end
