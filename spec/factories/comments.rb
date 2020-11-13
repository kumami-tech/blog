FactoryBot.define do
  factory :comment do
    association :post
    nickname                { Faker::Name.name }
    content                 { "コメント" }
  end
end