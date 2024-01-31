if Rails.env.production?
  redis_connection = ENV.fetch("REDIS_JOBS", "redis://redis:6379/1")

  Sidekiq.configure_server do |config|
    config.redis = {url: redis_connection}
  end

  Sidekiq.configure_client do |config|
    config.redis = {url: redis_connection}
  end
end
