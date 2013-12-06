class Madraspermissiontype < ActiveRecord::Base
  has_many :madraspermissions, :primary_key => 'Id', :foreign_key => 'PermissionTypeId', :class_name => 'Madraspermission'

  self.table_name = 'tblCst_ZHdK_Madras2_PermissionType'
  self.primary_key = 'Id'

end
