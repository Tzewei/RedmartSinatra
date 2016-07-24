require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/user'

#Controller
require './app'
#require './controllers/artists_controller'

# ALLOW DELETE AND PUT REQUEST
use Rack::MethodOverride
run RedmartSinatraApp
