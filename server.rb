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