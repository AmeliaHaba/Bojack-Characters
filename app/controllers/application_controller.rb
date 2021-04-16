require './config/environment'

class ApplicationController < Sinatra::Base # controlling actual app

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true 
    set :session_secret, "dianeismyfavorite"
    set :method_override, true
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/'
    end
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
      redirect "/characters"
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


end
