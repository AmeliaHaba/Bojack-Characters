class CharacterController < ApplicationController

    get '/characters' do # index
        @characters=Character.all 
    
        erb :'character/index'
    end

    get '/characters/new' do # new
        erb :'character/new'
    end 

    post '/characters' do
        @character = Character.create(params)
        @character.user_id = current_user.id
        redirect to "/characters/#{character.id}" # new
    end

    get '/characters/:id' do 
        @character = Character.find_by_id(params[:id])
        erb :'character/show'
    end 

    get '/characters/:id/edit' do  #load edit form
        @character = Character.find_by_id(params[:id])
        erb :'character/edit'
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