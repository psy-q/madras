class Madrasroutemodel < ActiveRecord::Base

  belongs_to :madrasroute, :foreign_key => 'RouteId', :primary_key => 'Id', :class_name => 'Madrasroute'
  belongs_to :madrasmodel, :foreign_key => 'ModelId', :primary_key => 'Id', :class_name => 'Madrasmodel'

  self.table_name = 'tblCst_ZHdK_Madras2_RouteModel'
  #self.primary_key = 'RouteId'

end
