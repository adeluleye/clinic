class Admin < ActiveRecord::Base
	

  has_secure_password

  # shortcut validations, aka "sexy validations"
  validates :username, :length => { :within => 8..25 },
                       :uniqueness => true
  

end
