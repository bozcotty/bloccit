FactoryGirl.define do
  factory :user do
    name "Firsty Lastname"
    email "firsty@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end