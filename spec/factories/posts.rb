FactoryBot.define do
  factory :post do
    association :user
    title        { "タイトル" }
    content      { "本文" }
    image        { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/image.jpg')) }
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
