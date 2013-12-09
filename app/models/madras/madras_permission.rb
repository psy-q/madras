class Madras::MadrasPermission < ActiveRecord::Base

  belongs_to :madrasapplication, :foreign_key => 'ApplicationId', :primary_key => 'Id', :class_name => 'MadrasApplication'
  belongs_to :madraspermissiontype, :foreign_key => 'PermissionTypeId', :primary_key => 'Id', :class_name => 'MadrasPermissiontype'

  has_many :madrasfieldpermissions, :primary_key => 'Id', :foreign_key => 'PermissionId', :class_name => 'MadrasFieldpermission'
#  has_many :madrasfieldpermissions, :primary_key => 'PermissionId', :foreign_key => 'Id', :class_name => 'Madrasfieldpermission'
  has_many :madrasfields, :through => :madrasfieldpermissions


  self.table_name = 'tblCst_ZHdK_Madras2_Permission'
  self.primary_key = 'Id'

end
