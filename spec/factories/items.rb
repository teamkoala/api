# frozen_string_literal: true

FactoryGirl.define do
  factory :item do
    name { Faker::Lorem.word }
    count { rand(1...100) }
    price { rand(1...100) }
  end
end
