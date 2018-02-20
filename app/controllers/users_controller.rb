class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/recipes'
    end
  end

  post '/signup' do
    if !params[:username].blank? && !params[:password].blank?
      user = User.create(params)
      if user
        session[:user_id] = user.id
        redirect "/users/#{user.username}"
      else
        redirect '/signup'
      end
    end
  end

  get '/logout' do
    session.destroy
    redirect '/recipes'
  end

end