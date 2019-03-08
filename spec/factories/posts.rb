FactoryBot.define do
  factory :post do
    title   { Faker::Quote.famous_last_words }
    kind    { 'article' }
    state   { 'published' }
    source  { 'cnn' }
    url     { Faker::Internet.url }
    publish_at { Date.today }

    after(:build) do |post|
      post.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
    end
  end
end