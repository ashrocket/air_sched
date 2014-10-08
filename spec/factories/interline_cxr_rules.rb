# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interline_cxr_rule do
    data_key nil
    markets "MyText"
    combinations "MyText"
    rule_kind "MyString"
    active ""
  end
end
