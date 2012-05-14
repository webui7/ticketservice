class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :ownername

      t.timestamps
    end
  end
end
