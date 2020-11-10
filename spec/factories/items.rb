FactoryBot.define do
  factory :item do
    item_name              {Faker::Name.last_name}
    description            {Faker::Lorem.sentence}
    category_id            {2}
    status_id              {2}
    shipping_cost_id       {2}
    prefectures_id         {2}
    days_to_ship_id        {2}
    price                  {222222}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-intro01.png'), filename: 'test_image.png')
    end
    
  end
end
