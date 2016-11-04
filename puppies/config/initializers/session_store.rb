Rails.application.config.session_store :redis_store,
  key: '_puppies_session',
  expires_in: 90.minutes,
  servers: {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'],
    db:   ENV['REDIS_DB_ID'],
    namespace: 'myapp:session:',
  }
