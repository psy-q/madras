FactoryGirl.define do
  factory :madrasapplication, class: Madras::MadrasApplication do
    APIKey {'SomeAPIKey'}
    Description {'Some description to the API key'}
  end
end
