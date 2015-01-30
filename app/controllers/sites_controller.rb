class SitesController < ApplicationController
  


def user_search
  #raise params.inspect 
  client = Instagram.client(:access_token => session[:access_token])
  p params
  @search = client.user_search(params[:q])
end

def tags_search
  client = Instagram.client(:access_token => session[:access_token])
  p params
  @search = client.tag_search(params[:q])
end


  #def index
  
  #end

  #def about
  #end

  #def collections
  #end

  

  #get "/user_search" do
  #client = Instagram.client(:access_token => session[:access_token])
  #for user in client.user_search("instagram")
  #end
  #html
#end

#post "/user_search" do


  #get "/tags" do
  #client = Instagram.client(:access_token => session[:access_token])
  #html = "<h1>Search for tags, get tag info and get media by tag</h1>"
  #tags = client.tag_search('cat')
  #html << "<h2>Tag Name = #{tags[0].name}. Media Count =  #{tags[0].media_count}. </h2><br/><br/>"
  #for media_item in client.tag_recent_media(tags[0].name)
   # html << "<img src='#{media_item.images.thumbnail.url}'>"
  #end
  #html
#end




end
