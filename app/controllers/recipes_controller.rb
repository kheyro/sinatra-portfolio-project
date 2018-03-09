class RecipesController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipes/recipes'
  end

  get '/recipes/add' do
    if logged_in?
      @ingredients = Ingredient.all
      erb :'/recipes/create_recipe'
    else
      redirect '/signin'
    end
  end

  get '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    if logged_in? && current_user.id == recipe.user.id
      @recipe = Recipe.find_by_id(params[:id])
      @ingredients = Ingredient.all
      erb :'/recipes/edit_recipe'
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/show_recipe'
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    if logged_in? && current_user.id == recipe.user.id
      recipe.update(params[:recipe])
      # check validation in model
      if recipe.save
        # Remove unselected ingredient (dropdown list)
        params[:quantity] = params[:quantity].delete_if { |q| q[:ingredient_id] == "Ingredient" }
        recipe.quantities.delete_all
        recipe.quantities.create(params[:quantity])
        redirect "/recipes/#{recipe.id}"
      else
        redirect "/recipes/add"
      end
    end
  end

  post '/recipes' do
    if logged_in?
      recipe = Recipe.new(params[:recipe])
      # check validation in model
      if recipe.save
        # Remove unselected ingredient (dropdown list)
        params[:quantity] = params[:quantity].delete_if { |q| q[:ingredient_id] == "Ingredient" }
        recipe.quantities.create(params[:quantity])
        recipe.user = current_user
        recipe.save
        redirect "/recipes/#{recipe.id}"
      else
        redirect "/recipes/add"
      end
    end
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    if logged_in? && current_user.id == recipe.user.id
      Recipe.destroy(params[:id])
      redirect "/users/#{current_user.username}"
    else
      redirect '/'
    end
  end

end
