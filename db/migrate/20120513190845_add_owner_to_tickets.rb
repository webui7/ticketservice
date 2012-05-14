class AddOwnerToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :owner_id, :integer

  end
end
