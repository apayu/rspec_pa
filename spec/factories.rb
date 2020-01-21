FactoryBot.define do
  factory :article do
    title { Faker::Lorem.question }
    description { Faker::Lorem.paragraphs }
  end
end
