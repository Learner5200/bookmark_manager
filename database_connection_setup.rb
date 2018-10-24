require './lib/database_connection'

DATABASES = {
  'test' => 'bookmark_manager_test',
  'development' => 'bookmark_manager'
}

database = DATABASES[ENV['ENVIRONMENT']]

DatabaseConnection.setup(database)
