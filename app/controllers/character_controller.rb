class CharacterController < ApplicationController

    get '/characters' do
        @characters=Character.all 
    
        erb :index
    end

    get '/characters/new' do
        erb :new
    end 

    patch '/characters/:id' do #edit action
        @character = Character.find_by_id(params[:id])
        @character.name = params[:name]
        @character.gender = params[:gender]
        @character.animal? = params[:animal?]
        @character.deppresed? = params[:depressed?]
        @character.save
    
        redirect to "/characters/#{@character.id}"
    end 

    get '/recipes/:id/edit' do  #load edit form
        @recipe = Recipe.find_by_id(params[:id])
        erb :edit
    end
    
    
    delete '/recipes/:id' do #delete action
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.delete
        redirect to '/recipes'
    end 
    

end 