class CreateWards < ActiveRecord::Migration
  def up
    create_table :wards do |t|

      t.string "ward_name", :limit => 25
      t.timestamps
    end
  end

  def down
  	drop_table :wards
  	
  end
end
