require './config/environment'

class ApplicationController < Sinatra::Base # controlling actual app

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :sessions_secret, "dianeismyfavorite"
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/user/#{user.id}/my_characters"
    else
      redirect "/signup"
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[ user_id]
    end
    def current user
     user.find(session[ user_id])
    end

  end


end
