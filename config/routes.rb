Rails.application.routes.draw do

  resources :games do
    resources :matches
  end

end
