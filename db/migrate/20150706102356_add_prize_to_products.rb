class AddPrizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :prize, :string
  end
end
