class PgEmpresa < ApplicationRecord
  # rails generate model PgEmpresa --skip-migration --no-test-framework
  self.abstract_class = true
  establish_connection :oracle_cloud_development
  self.table_name = "parger.pg_empresa"
  self.primary_key = "id_empresa"

  has_many :pg_area, foreign_key: :id_empresa
end
