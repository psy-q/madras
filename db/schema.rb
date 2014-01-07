# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "MadrasApplication", :primary_key => "Id", :force => true do |t|
    t.string "APIKey",      :limit => 32
    t.string "Description", :limit => 256
  end

  create_table "MadrasField", :primary_key => "Id", :force => true do |t|
    t.integer "ModelId",                :null => false
    t.string  "Name",    :limit => 128
  end

  add_index "MadrasField", ["ModelId", "Name"], :name => "ModelId", :unique => true

  create_table "MadrasFieldPermission", :id => false, :force => true do |t|
    t.integer "PermissionId", :null => false
    t.integer "FieldId",      :null => false
  end

  add_index "MadrasFieldPermission", ["PermissionId", "FieldId"], :name => "PermissionId", :unique => true

  create_table "MadrasModel", :primary_key => "Id", :force => true do |t|
    t.string "Name", :limit => 128
  end

  create_table "MadrasPermission", :primary_key => "Id", :force => true do |t|
    t.integer "ApplicationId",     :null => false
    t.integer "PermissionTypeId",  :null => false
    t.integer "FieldPermissionId", :null => false
  end

  add_index "MadrasPermission", ["ApplicationId", "PermissionTypeId", "FieldPermissionId"], :name => "ApplicationId", :unique => true

  create_table "MadrasPermissionType", :primary_key => "Id", :force => true do |t|
    t.string "Name", :limit => 32
  end

  create_table "MadrasRoute", :primary_key => "Id", :force => true do |t|
    t.string "RoutePattern", :limit => 256, :null => false
  end

  create_table "MadrasRouteModel", :id => false, :force => true do |t|
    t.integer "ModelId", :null => false
    t.integer "RouteId", :null => false
  end

  add_index "MadrasRouteModel", ["ModelId", "RouteId"], :name => "ModelId", :unique => true

  create_table "tblPerson", :primary_key => "IdPerson", :force => true do |t|
    t.string "PersonAnrede",   :limit => 64, :null => false
    t.string "PersonVorname",  :limit => 64, :null => false
    t.string "PersonNachname", :limit => 64, :null => false
  end

end
