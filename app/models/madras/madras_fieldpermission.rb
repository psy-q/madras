class Madras::MadrasFieldpermission < ActiveRecord::Base
  belongs_to :madraspermission, :foreign_key => 'PermissionId', :primary_key => 'Id', :class_name => 'MadrasPermission'
  belongs_to :madrasfield, :foreign_key => 'FieldId', :primary_key => 'Id', :class_name => 'Madrasfield'

  self.table_name = 'MadrasFieldPermission'
end
