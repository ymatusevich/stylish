class CreateStylishImages < ActiveRecord::Migration
  def change
    create_table :stylish_images do |t|
      t.string     :name
      t.string     :uid
      t.string     :description
      t.attachment :data
      t.boolean    :active, default: false
      t.boolean    :default, default: false
      t.string     :category

      t.timestamps
    end
  end
end
