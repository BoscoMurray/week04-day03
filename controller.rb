require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('models/student')
require_relative ('models/house')

#INDEX
get "/students" do
  @students = Student.all()
  erb(:index)
end

#NEW
get "/students/new" do
  @houses = House.all
  erb(:new)
end

#SHOW
get "/students/:id" do
  @student = Student.find(params["id"].to_i())
  erb(:show)
end

#CREATE
post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

#DELETE
post "/students/:id/delete" do
  student = Student.find(params["id"].to_i)
  student.delete
  redirect to("/students")
end