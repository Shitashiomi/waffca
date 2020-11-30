class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.string :category
      t.text :blog_introduction
      t.string :blog_image_id

      t.timestamps
    end
  end
end
