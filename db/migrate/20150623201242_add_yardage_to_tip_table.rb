class AddYardageToTipTable < ActiveRecord::Migration
  def change
    add_column :tips, :yardage, :integer
  end
end
