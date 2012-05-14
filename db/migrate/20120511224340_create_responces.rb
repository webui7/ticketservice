class CreateResponces < ActiveRecord::Migration
  def change
    create_table :responces do |t|
      t.string :content
      t.integer :ticket_id
      t.string :responce_id

      t.timestamps
    end
  end
end
