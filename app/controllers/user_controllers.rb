class UserControllers < ApplicationController


    get "/signup" do
        erb :signup
    end

    post '/signup' do
        if params[:username].empty? || params[:password].empty? 
          redirect "/failure"
        else 
          user = User.new(username: params[:username], password: params[:password])
          redirect "/user/#{user.id}"
        end
    end 

    get "/user/#{user.id}/my_characters" do 
        @user = User.find(params[:id])

        erb :'user/my_characters'
    end 

end 