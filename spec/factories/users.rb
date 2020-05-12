FactoryBot.define do
  factory :user do
    email {'jane@doe.com'}
    password {'password'}
    password_confirmation {'password'}
  end
end