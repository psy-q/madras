class Madrasmodel < ActiveRecord::Base

  has_many :madrasfields,      :primary_key => 'Id', :foreign_key => 'ModelId', :class_name => 'Madrasfield'
  has_many :madrasroutemodels, :primary_key => 'Id', :foreign_key => 'ModelId', :class_name => 'Madrasroutemodel'
  has_many :madrasroutes, :through => :madrasroutemodels

  self.table_name = 'tblCst_ZHdK_Madras2_Model'
  self.primary_key = 'Id'

end
