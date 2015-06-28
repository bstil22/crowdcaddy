class Course < ActiveRecord::Base
  has_many :holes
  has_many :tips, through: :holes
  validates :number_holes, presence: true
  validates :name, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :style, presence: true
end
