class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :name
      t.string  :state
      t.string  :city
      t.string  :architect
      t.string  :style
      t.string  :rating
      t.string  :slope
      t.integer :number_holes
    end
  end
end
