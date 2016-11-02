require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'db/connection'
require_relative 'models/pokemon'
require_relative 'models/trainer'

#Front Page
get '/pokemon' do
  @pokemons = Pokemon.all
  erb :"pokemon/index"
end

#New Pokemon Page
get '/pokemon/new' do
  erb :"pokemon/new"
end

#Pokemon Page
get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

#Creates new Pokemon
post '/pokemon' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

#Edit Pokemon Page
get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

#Edits Pokemon
put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

#Deletes Pokemon
delete '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemon"
end
