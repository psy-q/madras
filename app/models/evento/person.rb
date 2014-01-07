class Evento::Person < ActiveRecord::Base
  self.table_name = 'tblPerson'
  self.primary_key = 'IdPerson'

  # attr_accessible :title, :body
end
