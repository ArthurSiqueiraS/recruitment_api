Rails.application.routes.draw do
  get 'technologies/index'
  get 'locations/index'
  get 'experience_ranges/index'
  get 'jobs/index'
  get 'jobs/show'
  get 'candidates/index'
  get 'candidates/show'

  post 'update_base' => 'base_api#update'
end
