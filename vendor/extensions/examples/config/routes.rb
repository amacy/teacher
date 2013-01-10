Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :examples do
    resources :examples, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :examples, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :examples, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
