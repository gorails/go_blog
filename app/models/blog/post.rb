module Blog
  class Post < ApplicationRecord
    validates_presence_of :title, :user_id, :body
    belongs_to :user

    def list_text
      return '' if !teaser.blank? and !body.blank?
      teaser if !teaser.blank?
      body if !body.blank?
    end
  end
end
