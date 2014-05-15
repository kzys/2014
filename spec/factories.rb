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

  factory :post, aliases: [:english_post] do
    title 'Hello'
    content 'hello world'
    language 'en'

    association :author, factory: :author

    factory :japanese_post do
      language 'ja'
    end
  end
end
