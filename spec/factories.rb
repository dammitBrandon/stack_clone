require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "John"
    password "password"
    email "john@example.com"
  end
end
