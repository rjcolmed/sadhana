# == Route Map
#
#             Prefix Verb URI Pattern                                 Controller#Action
#               root GET  /                                           welcome#index
#    teacher_lessons GET  /teachers/:teacher_id/lessons(.:format)     lessons#index
#                    POST /teachers/:teacher_id/lessons(.:format)     lessons#create
# new_teacher_lesson GET  /teachers/:teacher_id/lessons/new(.:format) lessons#new
#     teacher_lesson GET  /teachers/:teacher_id/lessons/:id(.:format) lessons#show
#           teachers POST /teachers(.:format)                         teachers#create
#        new_teacher GET  /teachers/new(.:format)                     teachers#new
#            teacher GET  /teachers/:id(.:format)                     teachers#show
#           students POST /students(.:format)                         students#create
#        new_student GET  /students/new(.:format)                     students#new
#            student GET  /students/:id(.:format)                     students#show
#            lessons GET  /lessons(.:format)                          lessons#index
#                    POST /lessons(.:format)                          lessons#create
# 

Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :sessions, only: %i[destroy]

  resources :teachers, only: %i[new create show] do
    resources :lessons
  end

  resources :students, only: %i[new create show edit update]

  resources :lessons, only: %i[index create show update]
end
