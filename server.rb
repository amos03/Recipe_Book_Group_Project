require 'sinatra'
require_relative 'Recipebook'

get "/" do
    redirect to("/home")
end

get "/home" do
    @recipes = Recipebook.all
    erb :home
end

get "/about" do
    erb :about
end

get "/add_recipe_form" do
    @title = "add_recipe_form"
    erb :add_recipe_form
end

post "/add_recipe" do
    



    
end