class AddCourseId < ActiveRecord::Migration
  def change
    add_column :holes, :course_id, :integer
  end
end
