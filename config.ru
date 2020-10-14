require 'rubygems'
require 'bundler'

Bundler.require

require './app'


enable :sessions
set :session_secret, ENV['APP_SESSION_SECRET']

run FlickrIntegrationAPI
