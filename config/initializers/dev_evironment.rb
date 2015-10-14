unless Rails.env.production?
  ENV['APPLICATION_URL'] = "127.0.0.1"
  ENV['APPLICATION_PORT'] = "3000"
else
	ENV['APPLICATION_URL'] = "mysterious-spire-8112.herokuapp.com"
end