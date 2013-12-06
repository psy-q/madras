class Madrasfieldpermission < ActiveRecord::Base
  belongs_to :madraspermission, :foreign_key => 'PermissionId', :primary_key => 'Id', :class_name => 'Madraspermission'
  belongs_to :madrasfield, :foreign_key => 'FieldId', :primary_key => 'Id', :class_name => 'Madrasfield'

  self.table_name = 'tblCst_ZHdK_Madras2_Fieldpermission'
end
