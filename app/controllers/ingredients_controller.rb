class IngredientsController < ApplicationController

  get '/ingredients/add' do
    if logged_in? && current_user.username == "admin"
      erb :'/ingredients/create_ingredient'
    else
      redirect '/'
    end
  end

  post '/ingredients' do
    if logged_in? && current_user.username == "admin"
      if !Ingredient.find_by(name: params[:name])
        Ingredient.create(name: params[:name])
      end
      redirect '/ingredients'
    else
      redirect '/recipes'
    end
  end

  get '/ingredients/:id/edit' do
    if logged_in? && current_user.username == "admin"
      @ingredient = Ingredient.find_by_id(params[:id])
      erb :'/ingredients/edit_ingredient'
    else
      redirect '/'
    end
  end

  patch '/ingredients/:id' do
    if logged_in? && current_user.username == "admin"
      ingredient = Ingredient.find_by_id(params[:id])
      ingredient.update(name: params[:name])
      ingredient.save
      redirect '/ingredients'
    else
      redirect '/recipes'
    end
  end

  get '/ingredients/:id/delete' do
    if logged_in? && current_user.username == "admin"
      ingredient = Ingredient.find_by_id(params[:id])
      ingredient.delete
      redirect '/ingredients'
    else
      redirect '/recipes'
    end
  end

  get '/ingredients' do
    if logged_in? && current_user.username == "admin"
      @ingredients = Ingredient.all
      erb :'/ingredients/ingredients'
    else
      redirect '/'
    end
  end

end