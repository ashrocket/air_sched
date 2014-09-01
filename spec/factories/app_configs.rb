# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app_config do
    var "MyString"
    value "MyText"
    thing_id ""
    tip "MyText"
  end
end
