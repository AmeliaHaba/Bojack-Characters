require './config/environment'

class CharactersController < ApplicationController

    get '/characters' do # index # instance for redirecting, render to erb needs to be instance 
        @characters = Character.all 
    
        erb :'characters/index'
    end

    get '/characters/new' do # new
        if logged_in?
            erb :'characters/new'
        else 
            redirect to '/failure'
        end
    end 

    post '/characters' do
        @character = Character.create(params)
        @character.user_id = current_user.id
        redirect to "/characters/#{@character.id}"
    end

    get '/characters/:id' do 
        if Character.where(id: params[:id]).exists?
            if logged_in?
                @character = Character.find_by_id(params[:id])
                erb :'characters/show'
            else
                redirect to '/failure'
            end
        else
            redirect to '/failure'
        end
    end 

    get '/characters/:id/edit' do  #load edit form
        if Character.where(id: params[:id]).exists?
            if logged_in?
                @character = Character.find_by_id(params[:id])
                erb :'characters/edit'
            else
                redirect to '/failure'
            end 
        else
            redirect to '/failure'
        end
    end

    patch '/characters/:id' do #edit action
        character = Character.find_by_id(params[:id])
        params.delete(:_method)
        character.update(params)
    
        redirect to "/characters/#{character.id}"
    end 
    
    delete '/characters/:id' do #delete action
        character = Character.find_by_id(params[:id])
        character.destroy
        redirect to '/characters'
    end 
    

end 