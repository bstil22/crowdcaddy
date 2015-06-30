require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :tip do |f|
    user
    f.body { ('a'..'z').to_a.shuffle.join } 
    f.yardage {Random.new.rand(150..320) }
    f.hole_id {Random.new.rand(150..320)}
  end 

  factory :invalid_tip, parent: :tip do |f|
    user 
    f.body { ('a'..'z').to_a.shuffle.join } 
    f.yardage { nil }
    f.hole_id {Random.new.rand(150..320)}
  end 

end