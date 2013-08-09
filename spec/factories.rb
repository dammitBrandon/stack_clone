require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "John"
    password "password"
    email "john@example.com"
  end

  factory :question do
    title "Test Question: Who is the greatest POP Princess?"
    text  "this is question sample question text; but ask yourself what would Mike do?."
    user_id  1
  end

  factory :answer do
    text "Answer: Katy Perry"
    question_id 1
    user_id 1
  end
end
