class CharacterController < ApplicationController

    get '/characters' do # index
        @characters=Character.all 
    
        erb :index
    end

    get '/characters/new' do # new
        erb :new
    end 

    post '/characters' do
        @character = Character.create(:name => params[:name], :gender => params[:gender], :animal? => params[:animal?], :depressed => params[:depressed?])
        redirect to "/characters/#{character.id}" # new
    end

    get '/characters/:id' do 
        @character = Character.find_by_id(params[:id])
        erb :show 
    end 

    get '/characters/:id/edit' do  #load edit form
        @character = Character.find_by_id(params[:id])
        erb :edit
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

    
    
    delete '/characters/:id' do #delete action
        @character = Character.find_by_id(params[:id])
        @character.delete
        redirect to '/characters'
    end 
    

end 