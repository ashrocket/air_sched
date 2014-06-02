# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :oag_mail do
    status "MyString"
    received "2014-06-01 20:11:36"
    processed "2014-06-01 20:11:36"
    sched_count 1
  end
end
