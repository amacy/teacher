Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :long_term_assignments do
    resources :long_term_assignments, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :long_term_assignments, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :long_term_assignments, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
