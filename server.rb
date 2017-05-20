require "sinatra"
require "sinatra/activerecord"
require_relative "app/models/television_show"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app/views")

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  @shows = TelevisionShow.all
  erb :index
end

get "/television_shows/new" do
  @show = TelevisionShow.new
  erb :new
end

get "/television_shows/edit/:id" do
  @show = TelevisionShow.find(params[:id])
  erb :edit
end

get "/television_shows/:id" do
  @show = TelevisionShow.find(params[:id])

    if @show.ending_year.nil?
        @onair = "(Still on air)"
    end

  erb :show
end

post "/television_shows" do
  @show = TelevisionShow.new(params[:television_show])


  if @show.save
    redirect "/television_shows"
  else
    erb :new
  end


end

post "/television_shows/edit" do
  @show = TelevisionShow.new(params[:television_show])
  erb :show
end
