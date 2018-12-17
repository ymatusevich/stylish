module Stylish
  class Image < ActiveRecord::Base
    CATEGORIES = [1,2]
    CONTENT_TYPES = /\Aimage/.freeze

    attr_accessor :act

    attr_accessible :name, :description, :data, :active, :default, :category

    validates :name, :data, presence: true

    has_attached_file :data, validate_media_type: true #, styles: { thumb: 'x150', croppable: '600x600>' }
    validates_attachment_content_type :data, content_type: CONTENT_TYPES

    before_validation :set_defaults

    def self.categories
      CATEGORIES
    end

    private

    def set_defaults
      self.active = false if active.nil?
      self.default = false if default.nil?
    end
  end
end
