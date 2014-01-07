class Madras::MadrasPermissionType < ActiveRecord::Base
  has_many :madraspermissions, :primary_key => 'Id', :foreign_key => 'PermissionTypeId', :class_name => 'MadrasPermission'

  self.table_name = 'MadrasPermissionType'
  self.primary_key = 'Id'

end
