module HolesHelper
  def create_holes(course)
    x = 0
    if course.number_holes == '9'
      9.times do
        hole = course.holes.create
        hole.hole_number = x += 1
        hole.save!
      end
    else
      18.times do
        hole = course.holes.create
        hole.hole_number = x += 1
        hole.save!
      end
    end
  end
end
