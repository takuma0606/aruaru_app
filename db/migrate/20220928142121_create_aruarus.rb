class CreateAruarus < ActiveRecord::Migration[5.2]
  def change
    create_table :aruarus do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
