module EventoDb

  def self.seed
    FactoryGirl.create :person
    FactoryGirl.create :person, IdPerson: 10263, PersonVorname: "Peter", PersonNachname: "Muster"

    FactoryGirl.create :madrasapplication
    FactoryGirl.create :madrasapplication, APIKey: "ruben", Description: "Test api key ruben"
    FactoryGirl.create :madrasapplication, APIKey: "ValidKey", Description: "The API key is valid and has permissions"
    FactoryGirl.create :madrasapplication, APIKey: "ValidKeyNoPermissions", Description: "The API key is valid but has no permissions"

    FactoryGirl.create :madraspermission, ApplicationId: 1, PermissionTypeId: 2, FieldPermissionId: 1
    FactoryGirl.create :madraspermission, ApplicationId: 2, PermissionTypeId: 2, FieldPermissionId: 1
    FactoryGirl.create :madraspermission, ApplicationId: 3, PermissionTypeId: 2, FieldPermissionId: 1

    FactoryGirl.create :madraspermissiontype, Name: "create"
    FactoryGirl.create :madraspermissiontype, Name: "read"
    FactoryGirl.create :madraspermissiontype, Name: "update"
    FactoryGirl.create :madraspermissiontype, Name: "delete"


    FactoryGirl.create :madrasfield, Name: "IdPerson", ModelId: 1
    FactoryGirl.create :madrasfield, Name: "PersonAnrede", ModelId: 1
    FactoryGirl.create :madrasfield, Name: "PersonVorname", ModelId: 1
    FactoryGirl.create :madrasfield, Name: "PersonNachname", ModelId: 1


    FactoryGirl.create :madrasfieldpermission, FieldId: 1, PermissionId: 1
    FactoryGirl.create :madrasfieldpermission, FieldId: 2, PermissionId: 1
    FactoryGirl.create :madrasfieldpermission, FieldId: 3, PermissionId: 1
    FactoryGirl.create :madrasfieldpermission, FieldId: 4, PermissionId: 1

    FactoryGirl.create :madrasfieldpermission, FieldId: 1, PermissionId: 2
    FactoryGirl.create :madrasfieldpermission, FieldId: 2, PermissionId: 2
    FactoryGirl.create :madrasfieldpermission, FieldId: 3, PermissionId: 2
    FactoryGirl.create :madrasfieldpermission, FieldId: 4, PermissionId: 2

    FactoryGirl.create :madrasfieldpermission, FieldId: 1, PermissionId: 3
    FactoryGirl.create :madrasfieldpermission, FieldId: 2, PermissionId: 3
    FactoryGirl.create :madrasfieldpermission, FieldId: 3, PermissionId: 3
    FactoryGirl.create :madrasfieldpermission, FieldId: 4, PermissionId: 3



    FactoryGirl.create :madrasmodel, Name: "Person"


    FactoryGirl.create :madrasroute, RoutePattern: "/api/v1/people/%"



    FactoryGirl.create :madrasroutemodel, RouteId: 1, ModelId: 1

  end

end
