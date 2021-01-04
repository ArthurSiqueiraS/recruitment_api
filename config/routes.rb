Rails.application.routes.draw do
  get 'technologies' => 'technologies#index'
  get 'locations' => 'locations#index'
  get 'experience_ranges' => 'experience_ranges#index'
  get 'jobs' => 'jobs#index'
  get 'jobs/:id' => 'jobs#show'
  get 'candidates' => 'candidates#index'
  get 'candidates/:id' => 'candidates#show'

  post 'update_base' => 'base_api#update'
end
