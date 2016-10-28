FactoryGirl.define do


  factory :page do
    url { Faker::Internet.url }

    trait :with_content do
      content {
        {
          h2: [Faker::Lorem.sentence],
          h3: [Faker::Lorem.sentence],
          urls: [Faker::Internet.url, Faker::Internet.url],
        }
      }
    end
  end
end