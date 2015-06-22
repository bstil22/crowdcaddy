class Course < ActiveRecord::Base
  has_many :holes
  has_many :tips, through: :holes
  validates :number_holes, presence: true
end
