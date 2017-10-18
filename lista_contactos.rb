require 'sinatra'
require 'make_todo'

get '/' do
  @tasks = Tarea.all
  erb :index
end

post '/task/edit/:id' do
  task = Tarea.find(params[:id])
  Tarea.update(task["id"])
  redirect '/'
end

get '/tasks/new' do
  erb :new_task_form
end

post '/task' do
  Tarea.create(params[:task])
  redirect '/'
end

post '/task/:id' do
  task = Tarea.find(params[:id])
  Tarea.destroy(task["id"])
  redirect '/'
end
