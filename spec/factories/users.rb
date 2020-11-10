FactoryBot.define do
  factory :user do
    nickname              { 'yosida' }
    email                 {Faker::Internet.free_email}
    password              {'111aaa'}
    password_confirmation { password }
    last_name             { '吉田' }
    first_name            { '香織' }
    last_name_kana        { 'ヨシダ' }
    first_name_kana       { 'カオリ' }
    birth_day             { '1990-01-01' }
  end
end
