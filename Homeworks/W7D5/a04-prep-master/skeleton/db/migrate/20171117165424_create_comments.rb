class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.string :user_id
      t.string :link_id

      t.timestamps
    end
  end
end
