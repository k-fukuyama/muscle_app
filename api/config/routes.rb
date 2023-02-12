Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :api do
    mount_devise_token_auth_for 'User', at: '/v1/auth'

    mount Api::Root => '/'
  end
end
