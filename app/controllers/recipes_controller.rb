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