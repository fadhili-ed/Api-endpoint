FactoryBot.define do
  factory :todo do
    title { "MyString" }
    description { "MyText" }
    date { "2020-05-15" }
    user { nil }
  end
end
