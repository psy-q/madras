class Person < ActiveRecord::Base
  self.table_name = 'tblPerson'
  self.primary_key = 'IDPerson'

  # attr_accessible :title, :body
end
