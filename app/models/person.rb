class Person < ActiveRecord::Base
  set_table_name 'tblPerson'
  set_primary_key 'IDPerson'

  # attr_accessible :title, :body
end
