VkontakteApi.configure do |config|
  config.app_id = '4557485'
  config.app_secret = '1CPiSrcHxXWYTV7iWc9e'
  config.redirect_uri = 'http://rasiel.herokuapp.com/callback'
  # Faraday adapter to make requests with:
  # config.adapter = :net_http

  config.max_retries = 2

  config.logger = Rails.logger
  config.log_requests = true
  config.log_errors = true
  config.log_responses = true
end
