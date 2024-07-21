class PgEmpresa < ApplicationRecord
  # rails generate model PgEmpresa --skip-migration --no-test-framework
  self.abstract_class = true
  establish_connection :oracle_cloud_development
  self.table_name = 'parger.pg_empresa'
end
