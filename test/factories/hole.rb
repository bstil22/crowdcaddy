require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :hole do |f|
    course
    f.par { [3, 4, 5].sample } 
    f.yardage { Random.new.rand(100..580) }
    f.hole_number { Random.new.rand(1..18) } 
  end 
end