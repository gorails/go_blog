class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :teaser
      t.text :body, null: false
      t.boolean :draft,default: false
      t.datetime :published_at
      t.integer :user_id, null: false
      t.string :custom_url
      t.integer :access_count,default: 0

      t.timestamps
    end
  end
end
