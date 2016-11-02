# there is also config/sidekiq.yml including some other options

Sidekiq.logger = Rails.logger

Sidekiq.configure_server do |config|
  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'],
    db:   ENV['REDIS_DB_ID']
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'],
    db:   ENV['REDIS_DB_ID']
  }
end
