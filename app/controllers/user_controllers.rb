class UserControllers < ApplicationController
    get '/characters' do
        @character = Character.all
        erb :'character/index'
    end

    # post '/signup' do
    #     if params[:username].empty? || params[:password].empty? || params[:email].empty?
    #       redirect "/failure"
    #     else 
    #       user = User.new(username: params[:username], password: params[:password], email: params[:email])
    #       redirect "/library"
    #     end
    # end 
end 