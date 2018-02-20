class RecipesController < ApplicationController

  delete '/recipes/:id/delete' do
    if logged_in? && current_user.id == session[:user_id]
      recipe = Recipe.find(params[:id])
      recipe.delete
      redirect "/users/#{current_user.username}"
    else
      redirect '/'
    end
  end

  get '/recipes' do
    erb :'/recipes/recipes'
  end

end