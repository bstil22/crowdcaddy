class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.integer :yardage
      t.integer :par
    end
  end
end
