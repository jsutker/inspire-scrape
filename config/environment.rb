ENV['SINATRA_ENV'] ||= "development"

require 'open-uri'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require './app'

require_all 'models'