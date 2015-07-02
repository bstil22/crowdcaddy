class Course < ActiveRecord::Base
  has_many :holes
  has_many :tips, through: :holes
  validates :number_holes, presence: true
  validates :name, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :style, presence: true
  validates_numericality_of :slope, :greater_than_or_equal_to => 55, :less_than_or_equal_to => 155 
  validates_numericality_of :rating  
end
