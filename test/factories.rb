FactoryGirl.define do
  factory :author do
    name 'Alice'
    email 'alice@example.com'
    password 'passw0rd'
    password_confirmation 'passw0rd'
  end
end
