WebApi::Application.routes.draw do
	# Set up namespaces to
	# seperate API and to make it
	# easier to handle versioning.
	namespace :api, :default => { :format => 'json', :limit => 5 } do # /api/...
		namespace :v1 do # /api/v1/...

			# api/v1/resources
			resources :resources do
				# api/v1/resource/{:resource_id}/tags
				resources :tags
			end

			# /pi/v1/users
			resources :users do
				# api/v1/user/{:user_id}/resources
				resources :resources
			end

			# api/v1/tags
			resources :tags do
				# api/v1/tag/{:tag_id}/resources
				resources :resources
			end

			# api/vi/resource_types
			resources :resource_types do
				# api/v1/resource_type/{:resource_type_id}/resources
				resources :resources
			end

			# api/v1/licences
			resources :licences do
				# api/v1/licences//{:licence_id}/resources
				resources :resources
			end

			# Session routes, eg. login and logout.
			post 'login'  => 'login#login',  :as => 'login'
			get  'logout' => 'logout#index', :as => 'logout'

		end # end namespace /v1/
	end #end namespace /api/

	# Set up root
	root 'resources#index'
end
