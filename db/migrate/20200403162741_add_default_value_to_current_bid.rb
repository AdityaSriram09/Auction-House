class AddDefaultValueToCurrentBid < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :current_bid, 0
  end
end
