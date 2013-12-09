class Madras::MadrasRoute < ActiveRecord::Base

  has_many :madrasroutemodels, :foreign_key => 'RouteId', :primary_key => 'Id', :class_name => 'MadrasRoutemodel'
  
  has_many :madrasmodels, :through => :madrasroutemodels
  has_many :madrasfields, :through => :madrasmodels
  has_many :madraspermissions, :through => :madrasfields
  has_many :madraspermissiontypes, :through => :madraspermissions
  has_many :madrasapplications, :through => :madraspermissions

  self.table_name = 'tblCst_ZHdK_Madras2_Route'
  self.primary_key = 'Id'

end
