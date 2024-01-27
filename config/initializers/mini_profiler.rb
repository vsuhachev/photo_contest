# Do not let rack-mini-profiler disable caching
# Rack::MiniProfiler.config.disable_caching = false # defaults to true

if Rails.env.production?
  # set RedisStore
  Rack::MiniProfiler.config.storage_options = { url: ENV.fetch('REDIS_CACHE') }
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
else
  # set MemoryStore
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
end
