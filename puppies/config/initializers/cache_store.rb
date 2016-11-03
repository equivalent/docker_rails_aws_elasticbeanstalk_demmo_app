Rails
  .application
  .config
  .cache_store = :redis_store, {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'],
    db:   ENV['REDIS_DB_ID'],
    namespace: "cache",
    expires_in: 90.minutes,
  }
