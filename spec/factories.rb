FactoryGirl.define do
  sequence(:name) { |i| "Author #{i}" }
  sequence(:email) { |i| "author#{i}@example.com" }

  factory :author do
    name
    email
    password 'passw0rd'
    password_confirmation 'passw0rd'

    factory :admin do
      admin true
    end
  end

  factory :post do
    title 'Hello'
    content 'hello world'

    association :author, factory: :author

    factory :english_post do
      language 'en'
    end

    factory :japanese_post do
      language 'ja'
    end
  end
end
