class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.string "name", :limit => 25
      t.string "address", :limit => 50
      t.integer "age"
      t.string "diagnosis", :limit => 50
      t.string "status"
      t.integer "ward_id"
      t.timestamps
    end
  end

end
