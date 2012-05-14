class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :reference
      t.string :name
      t.string :email
      t.string :requestbody
      t.integer :department_id
      t.integer :status_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
