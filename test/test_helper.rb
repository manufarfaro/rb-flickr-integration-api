ENV['RACK_ENV'] = 'test'
require 'json'
require 'minitest/autorun'
require 'rack/test'
require 'test/unit'

require File.expand_path '../../app.rb', __FILE__