class AddTimeleftToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :timeleft, :datetime
  end
end
