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

  get '/ingredients/:id/edit' do
    if logged_in?
      @ingredient = Ingredient.find_by_id(params[:id])
      erb :'/ingredients/edit_ingredient'
    end
  end

  patch '/ingredients/:id' do
    if logged_in?
      ingredient = Ingredient.find_by_id(params[:id])
      ingredient.update(name: params[:name])
      ingredient.save
      redirect '/ingredients'
    else
      redirect '/recipes'
    end
  end

  get '/ingredients/:id/delete' do
    if logged_in?
      ingredient = Ingredient.find_by_id(params[:id])
      ingredient.delete
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