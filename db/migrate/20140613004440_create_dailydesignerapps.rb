class CreateDailydesignerapps < ActiveRecord::Migration
	def change
		create_table :dailydesignerapps do |t|
			t.string :name
			t.string :sex
			t.string :state
			t.string :city

			t.timestamps
		end
	end

	def self.down
		drop_table :products
	end
end
