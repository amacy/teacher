Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :homeworks do
    resources :homeworks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :homeworks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :homeworks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
