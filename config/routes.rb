Rails.application.routes.draw do

  resources :bloggers
  resources :posts
  resources :destinations
  patch '/posts/:id/like', to:"posts#like_post", as: "like"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
