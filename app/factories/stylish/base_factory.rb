module Stylish
  class BaseFactory
    include Singleton

    def get(name, *args)
      get_class(name).new(*args)
    end

    def get_class(name)
      "Stylish::#{@storage[name.to_sym]}".constantize
    end
  end
end
