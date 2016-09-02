unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

map '/' do
  use Rack::Auth::Basic, 'Protected Area' do |username, password|
    username == ENV['AUTH_USER'] && password == ENV['AUTH_PASSWORD']
  end

  run Sidekiq::Web
end
