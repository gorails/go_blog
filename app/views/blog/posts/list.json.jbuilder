json.array!(@blog_posts) do |post|
  json.extract! post, :id, :title, :teaser, :body, :published_at
  if post.custom_url
    json.link post.custom_url
  else
    json.link Rails.application.routes.url_helpers.blog_post_url(id: post.id)
  end
  json.author do |jautor|
    jautor.id post.user.id
    jautor.name post.user.name
    jautor.email post.user.email
  end
end
