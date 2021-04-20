require './config/environment'

class UsersController < ApplicationController

    get "/signup" do
        erb :'users/signup'
    end

    post '/signup' do
        if params[:username].empty? || params[:password].empty? 
          redirect to "/"
        else 
          user = User.create(username: params[:username], password: params[:password])
          session[:user_id] = user.id
          redirect to "/users/#{user.id}"
        end
    end 

    get '/users/:id' do
      if User.where(id: params[:id]).exists?
        @user = User.find_by_id(params[:id])
        erb :'users/show'
      else 
        redirect to "/"
      end
      
    end

end 