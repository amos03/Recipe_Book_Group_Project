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
    @title = "Add recipe form"
    erb :add_recipe_form
end

get "/edit_form/:id" do
    @title = "Edit recipe form"
    @recipe = Recipebook.find(params[:id])
    erb :edit_form
end



post "/add_recipe" do
    recipe = Recipebook.new
recipe.name = params[:name]
recipe.prep_time = params[:prep_time]
recipe.ingredients = params[:ingredients]
recipe.instructions = params[:instructions]

    if params[:meat] && params[:milk]
        recipe.name += " (not kosher)"
        recipe.dairy = true
        recipe.meat = true
        recipe.parve = false
    elsif params[:meat]
        recipe.dairy = false
        recipe.meat = true
        recipe.parve = false
    elsif params[:milk]
        recipe.dairy = true
        recipe.meat = false
        recipe.parve = false
    else
        recipe.dairy = false
        recipe.meat = false
        recipe.parve = true
    end
end

post "/edit_recipe/:id" do
    recipe = Recipebook.find(params[:id])
recipe.name = params[:name]
recipe.prep_time = params[:prep_time]
recipe.ingredients = params[:ingredients]
recipe.instructions = params[:instructions]
    if recipe.name.include? "(not kosher)"
recipe.name = recipe.name.delete_suffix(" (not kosher)")
    end
        if params[:meat] && params[:milk]
            recipe.name += " (not kosher)"
            recipe.dairy = true
            recipe.meat = true
            recipe.parve = false
        elsif params[:meat]
            recipe.dairy = false
            recipe.meat = true
            recipe.parve = false
        elsif params[:milk]
            recipe.dairy = true
            recipe.meat = false
            recipe.parve = false
        else
            recipe.dairy = false
            recipe.meat = false
            recipe.parve = true
        end

recipe.save
redirect to("/home")
end