# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    uid { SecureRandom.uuid } # Generates a random UUID for the 'uid' attribute
    name { Faker::Name.name }
    email { Faker::Internet.email }
    token { SecureRandom.hex(32) } # Generates a random 32-character hexadecimal token
    password { Devise::Encryptor.digest(User, 'test123') } 
  end
end
