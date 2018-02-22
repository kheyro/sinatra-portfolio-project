class RecipesController < ApplicationController

  get '/recipes' do
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

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/show_recipe'
  end

  post '/recipes' do
    if logged_in?
      recipe = Recipe.create(params[:recipe])
      recipe.quantities << Quantity.create(params[:quantity])

      if recipe.save
        current_user.recipes << recipe
        current_user.save
        redirect "/recipes/#{recipe.id}"
      else
        redirect "/recipes/add"
      end
    end
  end

  delete '/recipes/:id/delete' do
    if logged_in? && current_user.id == session[:user_id]
      recipe = Recipe.find(params[:id])
      recipe.delete
      redirect "/users/#{current_user.username}"
    else
      redirect '/'
    end
  end

end