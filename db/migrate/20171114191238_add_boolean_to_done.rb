class AddBooleanToDone < ActiveRecord::Migration[5.1]
  def change
    change_table :todos do |t|
      t.remove :done
      t.boolean :done 
    end
  end
end
