require_relative '../config/environment.rb'

ActiveRecord::Base.connection.migration_context.needs_migration?

RSpec.configure do |config|

end
