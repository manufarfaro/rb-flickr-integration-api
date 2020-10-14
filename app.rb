ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra'
require 'grape'
require 'flickraw'
require 'base58'

# Config
FlickRaw.api_key = ENV['FLICKR_API_KEY']
FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']


class FlickrIntegrationAPI < Grape::API

  version 'v1', using: :path
  format :json

  #/flickr
  namespace :flickr do
    #/photoset
    namespace :photoset do
      #/all
      get :all do
        user_id = '32874531@N04'
        photosets = []
        flickr.photosets.getList(user_id: user_id).each do |photoset|
          photosets.push(photoset.to_hash)
        end
        photosets
      end
      #/:id
      params do
        requires :id, type: Integer, desc: 'PhotoSet Id.'
      end
      route_param :id do
        get do
          begin
            photoset = flickr.photosets.getPhotos(photoset_id: params[:id])
            photos = []
            photoset.photo.each do |photo|
              flickr_url = "https://flic.kr/p/#{Base58.encode(photo.id.to_i)}"
              image_src = "https://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_b.jpg"
              photo_hash = photo.to_hash
              photo_hash[:flickr_url] = flickr_url
              photo_hash[:image_src] = image_src

              photos.push(photo_hash)
            end
            if photoset
              {
                id: photoset.id,
                owner: photoset.owner,
                ownername: photoset.ownername,
                photo: photos,
                page: photoset.page,
                per_page: photoset.per_page,
                perpage: photoset.perpage,
                pages: photoset.pages,
                total: photoset.total,
                title: photoset.title
              }
            else
              {}
            end
          rescue FlickRaw::FailedResponse => e
            error!({ status: 404, message: 'Not Found.' }, 404)
          end
        end
      end
    end
  end
end
