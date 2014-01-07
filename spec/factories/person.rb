FactoryGirl.define do
  factory :person, class: Evento::Person do
    IdPerson {10262}
    PersonAnrede {'Herr'}
    PersonVorname {'Ramon'}
    PersonNachname {'Cahenzli'}
  end
end
