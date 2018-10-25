#\ -w -p 5678
ENV['ENVIRONMENT'] ||= 'development'
require_relative "./app"
use Rack::MethodOverride
run BookmarkManager
