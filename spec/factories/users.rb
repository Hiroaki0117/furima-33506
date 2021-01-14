FactoryBot.define do
  factory :user do
    nickname {"あきら"}
    email {Faker::Internet.free_email}
    password {"111111a"}
    password_confirmation {"111111a"}
    family_name {"山本"}
    first_name  {"孝司"}
    kana_family_name {"ヤマモト"}
    kana_first_name  {"コウジ"}
    birth_day {"1997-03-21"}
  end
end