require './service'
require 'rspec'
require 'rack/test'

set :environment, :test

Rspec.configure do |config|
  config.color_enabled = true
  config.formatter = "documentation"
end
