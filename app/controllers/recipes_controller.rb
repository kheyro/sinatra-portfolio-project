class RecipesController < ApplicationController

  get '/recipes' do
    erb :'/recipes/recipes'
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
  end

end