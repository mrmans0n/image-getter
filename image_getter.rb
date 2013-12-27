require 'sinatra'
require 'rest_client'
require 'mechanize'
require 'json'

get '/' do
  ":)"
end

# example: /imgur_gallery?url=http://imgur.com/gallery/VP4kf
get '/imgur_gallery' do
  url = params[:url]
  response = RestClient.get "#{url}.json"
  parsed = JSON.parse(response)
  hash = parsed['data']['image']['album_images']['images'][0]['hash']
  ext = parsed['data']['image']['album_images']['images'][0]['ext']
  redirect "http://i.imgur.com/#{hash}#{ext}"
end

# example: /imgur?url=http://imgur.com/VP4kf
get '/imgur' do
  url = params[:url]
  mech = Mechanize.new
  page = mech.get(url)
  image_direct_url = page.at('link[@rel="image_src"]')[:href]
  redirect image_direct_url
end