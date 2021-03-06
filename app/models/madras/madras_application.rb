class Madras::MadrasApplication < ActiveRecord::Base

  has_many :madraspermissions, :primary_key => 'Id', :foreign_key => 'ApplicationId', :class_name => 'MadrasPermission'
  has_many :madraspermissiontypes, :through => :madraspermissions
  has_many :madrasfields, :through => :madraspermissions
  has_many :madrasmodels, :through => :madrasfields
  has_many :madrasroutes, :through => :madrasmodels

  self.table_name = 'MadrasApplication'
  self.primary_key = 'Id'

end
