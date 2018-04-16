class ChangeCatRentalRequest < ActiveRecord::Migration[5.1]
  def change

    change_column :cat_rental_requests, :cat_id, :integer
  end
end
