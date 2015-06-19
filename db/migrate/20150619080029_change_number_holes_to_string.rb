class ChangeNumberHolesToString < ActiveRecord::Migration
  def change
    change_column :courses, :number_holes, :string
  end
end
