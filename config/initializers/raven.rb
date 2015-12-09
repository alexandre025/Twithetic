require 'raven'

Raven.configure do |config|
  config.dsn = 'https://f4aeb6abd6924b1598c376b08e063d2f:6c422bc3ba9a40bba54df842274ecc83@app.getsentry.com/60882'
  config.environments = %w[ production ]
end