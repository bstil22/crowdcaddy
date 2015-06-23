Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/search' => 'welcome#query'
  resources :courses do
   resources :holes do
     resources :tips do
      member do
        put "like" => "tips#upvote"
        put "dislike" => "tips#downvote"
      end
    end
  end
end
end

