class Course < ActiveRecord::Base
  has_many :holes
  validates :number_holes, presence: true
end
