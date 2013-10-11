Bughub::Application.routes.draw do
  root :to => 'user#home'

  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             path_names: {new: 'sign_up'},
             controller: 'devise/registrations',
             as: :user_registration do
      get :cancel
    end
  end
  resource :user, :only => [] do
    get 'index'
  end

  resources :bugs, :only => [:index, :create, :show] do
    post 'query', :on => :collection
    resources :statuses, :only => [] do
      get 'conversion', :on => :member
    end
  end

  match '/404', :to => 'errors#not_found'
  match '/422', :to => 'errors#change_rejected'
  match '/500', :to => 'errors#something_wrong'
end
