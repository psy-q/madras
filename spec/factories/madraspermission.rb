FactoryGirl.define do
  factory :madraspermission, class: Madras::MadrasPermission do
    ApplicationId {1}
    PermissionTypeId {2}
    FieldPermissionId {1}
  end
end
