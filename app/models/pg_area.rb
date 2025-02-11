class PgArea < ApplicationRecord
  # rails generate model PgArea --skip-migration --no-test-framework
  self.abstract_class = true
  establish_connection :oracle_cloud_development
  self.table_name = "parger.pg_area"
  self.primary_keys = :id_empresa, :id_area

  belongs_to :pg_empresa, foreign_key: :id_empresa
end
