class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :usename
      t.string :ownername
      t.string :password

      t.timestamps
    end
  end
end
