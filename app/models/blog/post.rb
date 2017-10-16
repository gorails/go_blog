module Blog
  class Post < ApplicationRecord
    validates_presence_of :title, :user_id, :body
    belongs_to :user
    has_many :taggings
    has_many :tags, through: :taggings

    def self.tagged_with(name)
      Tag.find_by_name!(name).posts.where('? >= published_at and draft = ?', DateTime.now, false).includes(:user)
    end

    def text
       return teaser if teaser.present? and !teaser.blank?
       body if body.present? and !body.blank?
    end

    def reading_time
      words_per_minute = 150
      text = Nokogiri::HTML(self.body).at('body').inner_text
      (text.scan(/\w+/).length / words_per_minute).to_i
    end

    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
    end

    def all_tags
      self.tags.map(&:name).join(", ")
    end

  end
end
