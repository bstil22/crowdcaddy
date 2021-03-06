class Tip < ActiveRecord::Base
  before_save :capitalize_attributes
  belongs_to :user
  belongs_to :course
  belongs_to :hole
  validates :yardage, presence: true
  validates :body, presence: true
  validates :hole_id, :presence => true
  acts_as_votable

  def capitalize_attributes
    self.body = capitalize_sentences(body)
  end

  def capitalize_sentences(string)
    unless string.blank?
      string.gsub(/([a-z])((?:[^.?!]|\.(?=[a-z]))*)/i) { $1.upcase + $2.rstrip }
    end
  end
end
