class CharacterControllers < ApplicationController

    get '/characters' do # index #instance for redirecting, render to erb needs to be instance 
        @characters=Character.all 
    
        erb :'characters/index'
    end

    get '/characters/new' do # new
        erb :'characters/new'
    end 

    post '/characters' do
        @character = Character.create(params)
        @character.user_id = current_user.id
        redirect to "/characters/#{character.id}" # new
    end

    get '/characters/:id' do 
        @character = Character.find_by_id(params[:id])
        erb :'characters/show'
    end 

    get '/characters/:id/edit' do  #load edit form
        @character = Character.find_by_id(params[:id])
        erb :'characters/edit'
    end

    patch '/characters/:id' do #edit action
        @character = Character.find_by_id(params[:id])
        params.delete(:_method)
        @character.update(params)
    
        redirect to "/characters/#{@character.id}"
    end 
    
    delete '/characters/:id' do #delete action
        @character = Character.find_by_id(params[:id])
        @character.delete
        redirect to '/characters'
    end 
    

end 