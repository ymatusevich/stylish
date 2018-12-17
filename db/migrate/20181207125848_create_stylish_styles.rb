class CreateStylishStyles < ActiveRecord::Migration
  def change
    create_table :stylish_styles do |t|
      t.string  :name
      t.string  :description
      t.text    :data
      t.boolean :active, default: false
      t.boolean :default, default: false
      t.string  :category
    end
  end
end
