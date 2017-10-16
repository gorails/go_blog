Rails.application.routes.draw do
  namespace :blog do
    resources :posts do
      collection do
        get 'list'
        get 'show_list'
        get 'tags/:tag', to: 'posts#list', as: "tag"
      end
    end
  end
end
