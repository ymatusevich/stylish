module Stylish
  class Style < ActiveRecord::Base
    CATEGORIES = [1,2]
    attr_accessible :name, :description, :data, :active, :default, :category

    validates :name, uniqueness: true
    validates :name, presence: true
    validates :data, presence: true

    def self.categories
      CATEGORIES
    end
  end
end
