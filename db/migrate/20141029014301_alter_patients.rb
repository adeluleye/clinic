class AlterPatients < ActiveRecord::Migration
  def up
  	rename_table("patients", "xyz_patients")
  	add_column("xyz_patients","state",:string,:limit=>25)
  	change_column("xyz_patients","diagnosis",:string,:limit=>100)
  	rename_column("xyz_patients","status","condition")
  	add_index("xyz_patients","name")
  end

  def down
  	remove_index("xyz_patients","name")
  	rename_column("xyz_patients","condition","status")
  	change_column("xyz_patients","diagnosis",:string,:limit=>50)
  	remove_column("xyz_patients","state")
  	rename_table("xyz_patients", "patients")
  	  	
  end
end
