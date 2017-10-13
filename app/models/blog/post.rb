module Blog
  class Post < ApplicationRecord
    validates_presence_of :title, :user_id, :body
    belongs_to :user

    def list_text
      return '' if !teaser.blank? and !body.blank?
      teaser if !teaser.blank?
      body if !body.blank?
    end

    def reading_time
      words_per_minute = 150
      text = Nokogiri::HTML(self.body).at('body').inner_text
      (text.scan(/\w+/).length / words_per_minute).to_i
    end
  end
end
