class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :start_bid
      t.datetime :deadline
      t.string :contact
      t.binary :image
      t.integer :current_bid
      t.string :current_bidder
      t.boolean :sold , default: false

      t.timestamps
    end
  end
end
