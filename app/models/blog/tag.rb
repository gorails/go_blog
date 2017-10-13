class Blog::Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    self.select("blog_tags.name, count(blog_taggings.tag_id) as count").joins(:taggings).group("blog_taggings.tag_id,blog_tags.name")
  end
end
