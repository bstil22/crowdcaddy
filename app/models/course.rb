class Course < ActiveRecord::Base
  has_many :holes
  validate :hole_count

   private
    def hole_count
      errors.add(:base, "Hole count must be 18 or 9") unless self.holes.count == 18 || 9
    end
end
