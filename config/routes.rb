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
#            teachers GET    /teachers(.:format)                              teachers#index
#                     POST   /teachers(.:format)                              teachers#create
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
#          new_lesson GET    /lessons/new(.:format)                           lessons#new
#              lesson GET    /lessons/:id(.:format)                           lessons#show
#                     PATCH  /lessons/:id(.:format)                           lessons#update
#                     PUT    /lessons/:id(.:format)                           lessons#update
#   lesson_enrollment POST   /lessons/:lesson_id/enrollment(.:format)         enrollment#create
#         lesson_drop DELETE /lessons/:lesson_id/drop(.:format)               enrollment#destroy
#                     GET    /lessons/:id(.:format)                           lessons#show
#                tags GET    /tags(.:format)                                  tags#index
#                     POST   /tags(.:format)                                  tags#create
#             new_tag GET    /tags/new(.:format)                              tags#new
# 

Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: %i[destroy]

  resources :teachers, only: %i[index new create show] do
    resources :lessons
  end

  resources :students, only: %i[new create show edit update] do
    resources :lessons, only: %i[index]
  end

  resources :lessons, only: %i[index new create show update]

  resources :lessons, only: %i[show] do
    post '/enrollment', to: 'enrollment#create', as: 'enrollment'
    delete '/drop', to: 'enrollment#destroy', as: 'drop'
  end

  resources :tags, only: %i[new show create]

  resources :users, only: %i[new show create]
end
