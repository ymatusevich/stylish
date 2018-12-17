module Stylish
  class BaseService
    def initialize(object, params = {})
      @object = object
      @params = params.dup
    end

    def call
      within_transaction(&method(:execute!))
    end

    protected

    def within_transaction
      raise RuntimeError('no block given') unless block_given?

      @object.class.transaction do
        yield
      end
    end
  end
end
