#\ -w -p 5678
ENV['ENVIRONMENT'] ||= 'development'
require_relative "./app"
require_relative "./database_connection_setup"
use Rack::MethodOverride
run BookmarkManager
