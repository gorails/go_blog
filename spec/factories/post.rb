FactoryBot.define do # frozen_string_literal: true.
  factory :post, class: Blog::Post do
  	title FFaker::Lorem.phrase
  	teaser FFaker::Lorem.phrase
  	body FFaker::Lorem.paragraphs 3
  	draft false
  	published_at {Time.now - rand(5).day}
  end
end
