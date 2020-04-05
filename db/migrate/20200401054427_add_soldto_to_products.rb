class AddSoldtoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :soldto, :string
  end
end
