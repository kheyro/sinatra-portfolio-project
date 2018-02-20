class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/recipes'
    end
  end

  post '/signup' do
    params[:user][:role_id] = 2
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.username}"
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/recipes'
  end

end