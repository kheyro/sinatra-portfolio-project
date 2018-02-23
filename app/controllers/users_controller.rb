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
    params[:user][:username] = params[:user][:username].gsub(" ", "-").downcase
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.username}"
    else
      redirect '/signup'
    end
  end

  get '/signin' do
    erb :'/users/signin'
  end

  post '/signin' do
    if !logged_in?
      user = User.find_by(username: params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect "/users/#{user.username}"
      else
        redirect '/signin'
      end
    else
      redirect '/'
    end
  end

  get '/users/:slug' do
    @user = User.find_by(username: params[:slug])
    if @user.username != "admin"
      erb :'/users/user_recipes'
    else
      redirect '/ingredients'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/recipes'
  end

end