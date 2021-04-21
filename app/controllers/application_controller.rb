require './config/environment'

class ApplicationController < Sinatra::Base # controlling actual app

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true 
    set :session_secret, "dianeismyfavorite"
    set :method_override, true
  end

  get "/" do
    erb :login
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect "/signup"
    end
  end


  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
     User.find(session[:user_id])
    end

  end

  get "/failure" do
    erb :failure
  end


end
