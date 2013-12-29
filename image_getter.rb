require 'sinatra'
require 'rest_client'
require 'mechanize'
require 'json'

def oembed_retrieve_param(oembed_url, original_url, param)
  response = RestClient.get "#{oembed_url}?url=#{original_url}&format=json"
  parsed = JSON.parse(response)
  parsed[param]
end

get '/' do
  ':)'
end

error do
  'I AM ERROR'
end

not_found do
  'dolan pls'
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

# example: /flickr?url=http://www.flickr.com/photos/frontis/9661414791
get '/flickr' do
  url = params[:url]
  redirect oembed_retrieve_param('http://www.flickr.com/services/oembed',url,'url')
end

# example: /xkcd?url=xkcd.com/1305/ 
get '/xkcd' do
  url = params[:url]
  mech = Mechanize.new
  page = mech.get(url)
  image_direct_url = page.at('#comic>img')[:src]
  redirect image_direct_url
end

# example: /instagram?url=http://instagram.com/p/ieTMnVJREm/
get '/instagram' do
  url = params[:url]
  mech = Mechanize.new
  page = mech.get(url)
  image_direct_url = page.at('meta[property="og:image"]')[:content]
  redirect image_direct_url
end

# example: /youtube?url=http://www.youtube.com/watch?v=gFzLMGKtY04
get '/youtube' do
  url = params[:url]
  redirect oembed_retrieve_param('http://www.youtube.com/oembed/',url,'thumbnail_url')
end