# Staff Model

# name (str) - present
# email (str) - present / unique
# library_id (int) - present

# belongs_to library

class StaffMember < ActiveRecord::Base

  belongs_to :library
  
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true	
end

##don't know how to test for uniqueness without a test database