# == Route Map
#
#      Prefix Verb URI Pattern             Controller#Action
#        root GET  /                       welcome#index
#    teachers POST /teachers(.:format)     teachers#create
# new_teacher GET  /teachers/new(.:format) teachers#new
#     teacher GET  /teachers/:id(.:format) teachers#show
#    students POST /students(.:format)     students#create
# new_student GET  /students/new(.:format) students#new
#     student GET  /students/:id(.:format) students#show
# 

Rails.application.routes.draw do
  root 'welcome#index'

  resources :teachers, only: %i[new create show] do
    resources :lessons, only: %i[index new create show]
  end

  resources :students, only: %i[new create show]

  resources :lessons, only: %i[index create]
end
