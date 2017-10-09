Rails.application.routes.draw do
  namespace :blog do
    resources :posts do
      collection do
        get 'list'
        get 'show_list'
      end
    end
  end
end
