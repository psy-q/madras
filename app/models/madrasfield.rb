class Madrasfield < ActiveRecord::Base
#  has_and_belongs_to_many :madraspermissions, :foreign_key => 'FieldId', :class_name => 'Madraspermission'
#  has_and_belongs_to_many :madraspermissions, :join_table => 'tblCst_ZHdK_Madras2_FieldPermission', :class_name => 'Madraspermission'

  belongs_to :madrasmodel, :primary_key => 'Id', :foreign_key => 'ModelId', :class_name => 'Madrasmodel'
#  belongs_to :madrasmodel, :primary_key => 'ModelId', :foreign_key => 'Id', :class_name => 'Madrasmodel'
 
  has_many :madrasfieldpermissions, :primary_key => 'Id', :foreign_key => 'FieldId', :class_name => 'Madrasfieldpermission'
  has_many :madraspermissions, :through => :madrasfieldpermissions
  has_many :madrasapplications, :through => :madraspermissions
  has_many :madrasroutes, :through => :madrasmodel


  self.table_name = 'tblCst_ZHdK_Madras2_Field'
  self.primary_key = 'Id'

end
