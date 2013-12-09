class Madras::MadrasField < ActiveRecord::Base
  belongs_to :madrasmodel, :primary_key => 'Id', :foreign_key => 'ModelId', :class_name => 'MadrasModel'
#  belongs_to :madrasmodel, :primary_key => 'ModelId', :foreign_key => 'Id', :class_name => 'Madrasmodel'
 
  has_many :madrasfieldpermissions, :primary_key => 'Id', :foreign_key => 'FieldId', :class_name => 'MadrasFieldpermission'
  has_many :madraspermissions, :through => :madrasfieldpermissions
  has_many :madrasapplications, :through => :madraspermissions
  has_many :madrasroutes, :through => :madrasmodel


  self.table_name = 'tblCst_ZHdK_Madras2_Field'
  self.primary_key = 'Id'

end
