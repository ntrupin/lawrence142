Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  root "articles#index"
  resources :articles
  resources :authors
  scope "/", controller: :static do
    (StaticController.action_methods.to_a)
      .each do |action_method|
        get action_method
      end
  end 
end
