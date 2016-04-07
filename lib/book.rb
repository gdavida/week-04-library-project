
# title (str) - present
# author (str) - present
# isbn (int) - present / unique
# library_id (int) - present
# checked_out? (boolean) - present
# patron - present
# belongs_to library
# belongs_to patron


class Book < ActiveRecord::Base

  belongs_to :library
  belongs_to :patron
  
	validates :title, presence: true
	validates :author, presence: true
	validates :isbn, presence: true, uniqueness: true
	# validates :checked_out, presence: true

end

##don't know how to test for uniqueness without a test database