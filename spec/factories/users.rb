FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    last_name_zen         {'田中'}
    first_name_zen        {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {'2000-01-01'}
  end
end