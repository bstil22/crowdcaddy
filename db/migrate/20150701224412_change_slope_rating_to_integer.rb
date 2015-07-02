class ChangeSlopeRatingToInteger < ActiveRecord::Migration
  def change
    change_column :courses, :rating, 'integer USING CAST(rating AS integer)'
    change_column :courses, :slope, 'integer USING CAST(slope AS integer)'
  end
end
