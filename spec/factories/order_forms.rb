FactoryBot.define do
  factory :order_form do
    postal_code    {"123-4567"}
    prefecture_id  {2}
    municipality   {"赤かか"}
    address        {"黄いい"}
    building_name  {"青おおお"}
    phone_number   {12345678910}
    token          {"tok_abcdefghijk00000000000000000"}
    item_id        {2}
    user_id        {2}
    purchase_id    {2}
  end
end
