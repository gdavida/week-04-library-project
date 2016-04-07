# Patron Model

# name (str) - present
# email (str) - present
# book_id (int) - present

# has_many books

class Patron < ActiveRecord::Base

  has_many :books
  
	validates :name, presence: true
	validates :email, presence: true	
end

##don't know how to test for uniqueness without a test database

