require './config/environment'

class CharactersController < ApplicationController

    get '/characters' do # index # instance for redirecting, render to erb needs to be instance 
        redirect_if_not_logged_in
        @characters = Character.all 
    
        erb :'characters/index'
    end

    get '/characters/new' do # new
        redirect_if_not_logged_in
        erb :'characters/new'
    end 

    post '/characters' do
        redirect_if_not_logged_in
        @character = Character.create(params)
        @character.user_id = current_user.id
        redirect to "/characters/#{@character.id}"
    end

    get '/characters/:id' do 
        redirect_if_not_logged_in
        @character = Character.find_by_id(params[:id])
        erb :'characters/show'
    end 

    get '/characters/:id/edit' do  #load edit form
        redirect_if_not_logged_in
        @character = Character.find_by_id(params[:id])
        erb :'characters/edit'
    end

    patch '/characters/:id' do #edit action
        redirect_if_not_logged_in
        character = Character.find_by_id(params[:id])
        params.delete(:_method)
        character.update(params)
    
        redirect to "/characters/#{character.id}"
    end 
    
    delete '/characters/:id' do #delete action
        redirect_if_not_logged_in
        character = Character.find_by_id(params[:id])
        character.destroy
        redirect to '/characters'
    end 
    

end 