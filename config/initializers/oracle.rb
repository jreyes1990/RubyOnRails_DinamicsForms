# config/initializers/oracle.rb
# Rails.application.config.after_initialize do
#   oracle_config = Rails.application.config.database_configuration['oracle_development']
#   if oracle_config
#     # Solo establece la conexión para consultas, no para migraciones
#     ActiveRecord::Base.establish_connection(oracle_config)
#     puts "Connection to Oracle established successfully!"
#   else
#     puts "Oracle configuration not found"
#   end
# end
