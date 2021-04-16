require './config/environment'

class UsersController < ApplicationController

    get "/signup" do
        erb :'users/signup'
    end

    post '/signup' do
        if params[:username].empty? || params[:password].empty? 
          redirect "/failure"
        else 
          user = User.create(username: params[:username], password: params[:password])
          session[:user_id] = user.id
          redirect "/users/#{user.id}"
        end
    end 

    get '/users/:id' do
      @user = User.find_by_id(params[:id])
      erb :'users/show'
    end

end 