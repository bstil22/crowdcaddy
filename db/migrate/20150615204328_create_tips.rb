class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :body
      t.integer :user_id
      t.integer :course_id
      t.integer :hole_id
      t.timestamps
    end
  end
end
