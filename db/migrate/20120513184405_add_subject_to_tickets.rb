class AddSubjectToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :subject, :string

  end
end
