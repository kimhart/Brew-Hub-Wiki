require "pry"
require "sinatra"

require_relative "db/db_config"
require_relative "server"

run App::Server