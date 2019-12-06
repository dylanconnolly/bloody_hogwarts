Rails.application.routes.draw do
  get '/students', to: 'students#index'
  get '/students/:student_id', to: 'students#show'
end
