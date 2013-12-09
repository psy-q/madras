class Madras::MadrasModel < ActiveRecord::Base

  has_many :madrasfields,      :primary_key => 'Id', :foreign_key => 'ModelId', :class_name => 'MadrasField'
  has_many :madrasroutemodels, :primary_key => 'Id', :foreign_key => 'ModelId', :class_name => 'MadrasRoutemodel'
  has_many :madrasroutes, :through => :madrasroutemodels

  self.table_name = 'tblCst_ZHdK_Madras2_Model'
  self.primary_key = 'Id'

end
