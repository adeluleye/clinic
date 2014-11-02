class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards do |t|

      t.string "name", :limit => 25
      t.timestamps
    end
  end

end
