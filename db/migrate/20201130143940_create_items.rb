class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :introduction
      t.string :item_image_id
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
