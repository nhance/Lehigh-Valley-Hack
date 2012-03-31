require File.join(File.expand_path(File.dirname(__FILE__)), 'loader')
require 'sinatra'

get '/' do
  content_type :json
  raise "ADDRESS GIVE IT TO ME." if params[:address].nil?

  score = WalkscoreAPI.score(params[:address])
  score.to_json
end

get '/walk_shed' do
  content_type :json
  raise "WHERE IS MY ADDRESS????" if params[:address].nil?

  walk_shed = WalkscoreAPI.walk_shed(params[:address])
  walk_shed
end

get '/stop_search' do
  content_type :json
  require "ADDRESS REQUIRED" if params[:address].nil?

  stop_search = WalkscoreAPI.stop_search(params[:address])
  stop_search.to_json
end
