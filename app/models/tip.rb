class Tip < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :hole
  acts_as_votable
end
