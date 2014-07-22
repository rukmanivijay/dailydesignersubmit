class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :username
      t.string :password
      t.string :sex
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
