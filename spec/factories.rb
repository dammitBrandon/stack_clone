require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "John"
    password "password"
    email "john@example.com"
  end

  factory :question do
    title "Test Question"
    text  "this is question sample text"
    user_id  1
  end

  factory :answer do
    text "Test Answer"
    question_id 1
    user_id 1
  end
end
