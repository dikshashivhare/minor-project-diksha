
Rails.application.routes.draw do

 root to: "home#index" 
 resources :jobs, only: [:index, :show]
 
 devise_for :job_seekers, controllers: 
 {
   sessions: 'job_seekers/sessions',
   registrations: 'job_seekers/registrations',
   passwords: 'job_seekers/passwords',
   confirmations: 'job_seekers/confirmations',
   unlocks: 'job_seekers/unlocks'
 }
 devise_for :employeers, controllers: 
 {
   sessions: 'employeers/sessions',
   registrations: 'employeers/registrations',
   passwords: 'employeers/passwords',
   confirmations: 'employeers/confirmations',

   unlocks: 'employeers/unlocks'
 }
 devise_for :admins, controllers: 
 {
   sessions: 'admins/sessions',
   registrations: 'admins/registrations',
   passwords: 'admins/passwords',
   confirmations: 'admins/confirmations',

   unlocks: 'admins/unlocks'
 }
 get '/browse-jobs-result' => "home#all_jobs"
 get'home/about'
 get'home/contact_us'

  namespace :admin do 
    resources :jobs
    resources :job_categories
    resources :job_seekers
    resources :employeers
    resources :companies
  end

  namespace :employeer do 
    resources :jobs
    resources :companies
  end

  get '/apply-for-job' => "apply_job#register"
  post 'apply_job/create_job_registration'


end
