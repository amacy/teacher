Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :classworks do
    resources :classworks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :classworks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :classworks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
