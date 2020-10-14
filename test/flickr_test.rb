require File.expand_path '../test_helper.rb', __FILE__

class FlickrTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    FlickrIntegrationAPI
  end

  test 'it responds with a 200 status on photoset :all resource' do
    get '/v1/flickr/photoset/all'
    assert last_response.ok?, "Response code should be 200 : got #{last_response.status}"
  end

  test 'it responds with a 200 status on specific photoset get photos resource' do
    get '/v1/flickr/photoset/72157659794172398'
    assert last_response.ok?, "Response code should be 200 : got #{last_response.status}"
  end

  test 'it responds with a 404 status if pageset has invalid id' do
    get '/v1/flickr/photoset/cookie'
    assert last_response.bad_request?, "Response code should be 408 : got #{last_response.status}"
  end

  test 'it responds with a 404 status if pageset not found' do
    get '/v1/flickr/photoset/0'
    assert last_response.not_found?, "Response code should be 404 : got #{last_response.status}"
  end
end