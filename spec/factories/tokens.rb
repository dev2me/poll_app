FactoryGirl.define do
  factory :token do
    expires_at "2016-07-29 00:56:36"
    token "MyString"
    association :user, factory: :user
  end
end
