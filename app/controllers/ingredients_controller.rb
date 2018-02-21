class IngredientsController < ApplicationController

  get '/ingredients/add' do
    if logged_in?
      erb :'/ingredients/create_ingredient'
    end
  end

  post '/ingredients' do
    if logged_in?
      if !Ingredient.find_by(name: params[:name])
        Ingredient.create(name: params[:name])
      end
      redirect '/ingredients'
    else
      redirect '/recipes'
    end
  end

  get '/ingredients' do
    if logged_in?
      @ingredients = Ingredient.all
      erb :'/ingredients/ingredients'
    end
  end


end