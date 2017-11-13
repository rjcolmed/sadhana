# == Route Map
#
#              Prefix Verb   URI Pattern                                      Controller#Action
#                root GET    /                                                welcome#index
#               login GET    /login(.:format)                                 sessions#new
#                     POST   /login(.:format)                                 sessions#create
#              logout DELETE /logout(.:format)                                sessions#destroy
#             session DELETE /sessions/:id(.:format)                          sessions#destroy
#     teacher_lessons GET    /teachers/:teacher_id/lessons(.:format)          lessons#index
#                     POST   /teachers/:teacher_id/lessons(.:format)          lessons#create
#  new_teacher_lesson GET    /teachers/:teacher_id/lessons/new(.:format)      lessons#new
# edit_teacher_lesson GET    /teachers/:teacher_id/lessons/:id/edit(.:format) lessons#edit
#      teacher_lesson GET    /teachers/:teacher_id/lessons/:id(.:format)      lessons#show
#                     PATCH  /teachers/:teacher_id/lessons/:id(.:format)      lessons#update
#                     PUT    /teachers/:teacher_id/lessons/:id(.:format)      lessons#update
#                     DELETE /teachers/:teacher_id/lessons/:id(.:format)      lessons#destroy
#            teachers POST   /teachers(.:format)                              teachers#create
#         new_teacher GET    /teachers/new(.:format)                          teachers#new
#             teacher GET    /teachers/:id(.:format)                          teachers#show
#     student_lessons GET    /students/:student_id/lessons(.:format)          lessons#index
#            students POST   /students(.:format)                              students#create
#         new_student GET    /students/new(.:format)                          students#new
#        edit_student GET    /students/:id/edit(.:format)                     students#edit
#             student GET    /students/:id(.:format)                          students#show
#                     PATCH  /students/:id(.:format)                          students#update
#                     PUT    /students/:id(.:format)                          students#update
#             lessons GET    /lessons(.:format)                               lessons#index
#                     POST   /lessons(.:format)                               lessons#create
#              lesson GET    /lessons/:id(.:format)                           lessons#show
#                     PATCH  /lessons/:id(.:format)                           lessons#update
#                     PUT    /lessons/:id(.:format)                           lessons#update
#   lesson_enrollment POST   /lessons/:lesson_id/enrollment(.:format)         enrollment#create
#                     GET    /lessons/:id(.:format)                           lessons#show
# 

Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: %i[destroy]

  resources :teachers, only: %i[new create show] do
    resources :lessons
  end

  resources :students, only: %i[new create show edit update] do
    resources :lessons, only: %i[index]
  end

  resources :lessons, only: %i[index create show update]

  resources :lessons, only: %i[show] do
    post '/enrollment', to: 'enrollment#create', as: 'enrollment'
  end

  resources :tags, only: %i[create]
end
