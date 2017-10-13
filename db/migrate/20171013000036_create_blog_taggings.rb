class CreateBlogTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_taggings do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps
    end
  end
end
