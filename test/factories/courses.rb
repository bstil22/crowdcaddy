require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :course do |f| 
    f.name { Faker::Name.first_name } 
    f.state { Faker::Address.state } 
    f.architect {Faker::Name.name }
    f.style {["Links", "Parkland", "Desert", "Heathland", "Resort"].sample }
    f.rating {Random.new.rand(69.0..75.0)}
    f.slope {Random.new.rand(55..155)}
    f.number_holes {["9", "18"].sample}
  end 
end