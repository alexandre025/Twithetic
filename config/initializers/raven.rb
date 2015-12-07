require 'raven'

Raven.configure do |config|
  config.dsn = 'https://ecb1d92a0e894eb0b8a54a5cd6336082:7cd3d74492f94524b46a9375c25fb64e@app.getsentry.com/60697'
  config.environments = %w[ production ]
end