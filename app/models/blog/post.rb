module Blog
  class Post < ApplicationRecord
    validates_presence_of :title, :user_id, :body
    belongs_to :user
  end
end
