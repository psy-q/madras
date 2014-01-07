class Madras::MadrasRoutemodel < ActiveRecord::Base

  belongs_to :madrasroute, :foreign_key => 'RouteId', :primary_key => 'Id', :class_name => 'MadrasRoute'
  belongs_to :madrasmodel, :foreign_key => 'ModelId', :primary_key => 'Id', :class_name => 'MadrasModel'

  self.table_name = 'MadrasRouteModel'
  #self.primary_key = 'RouteId'

end
