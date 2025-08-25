# RB Flickr Integration API

 [![status: deprecated](https://img.shields.io/badge/status-deprecated-critical.svg)](https://github.com/manufarfaro/rb-flickr-integration-api)

> [!WARNING]
> This repository is deprecated and will be archived. No further maintenance or updates are planned.

## Overview

This is a historical codebase I used to integrate the Flickr API into my applications when I worked with Ruby. Some changes were made to protect privacy, and the original commit history was not preserved.

> Originally Developed in 2015.

## Run locally

### Requirements
- **Ruby** with **Bundler** installed

### Setup
```bash
bundle install
```

### Environment variables
Set the following before running (values shown are placeholders):
```bash
export FLICKR_API_KEY=your_flickr_api_key
export FLICKR_SHARED_SECRET=your_flickr_shared_secret
export APP_FLICKR_USER_ID=your_flickr_user_id
export APP_SESSION_SECRET=dev-session-secret # optional but recommended
```

### Start the server
```bash
bundle exec rackup
# or explicitly
bundle exec rackup -p 9292
```
The API will be available at `http://localhost:9292`.

### Example requests
```bash
# List all photosets for the configured user
curl http://localhost:9292/v1/flickr/photoset/all

# Get photos for a specific photoset (replace with a real photoset id)
curl http://localhost:9292/v1/flickr/photoset/72157659794172398
```

### Run tests
```bash
bundle install
bundle exec ruby test/flickr_test.rb
```
