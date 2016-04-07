require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"


#### BOOKS

# Index
get '/books' do
  @books = Book.all
  erb :books_index
end

# New
get '/books/new' do
  @book = Book.new
  erb :books_new
end

# Create
post '/books' do
  # create insect object
  @book = Book.new(params)

  if @book.save
    redirect to('/books')
  else
    erb :books_new
  end
end

# Show
get '/books/:id' do
  @book = Book.find_by_id(params['id']) # nil or Insect object
  erb :books_show
end

# Edit
get '/books/:id/edit' do
  @book = Book.find_by_id(params['id']) # nil or Insect object
  @libraries = Library.all #books belongs to this
  @patrons = Patron.all #books belongs to this
  erb :books_edit
end

# Update
post '/books/:id' do
  @book = Book.find_by_id(params['id'])
  @library = Library.find_by_id(params['library_id'])
  @patron = Patron.find_by_id(params['patron_id'])

  if @book.update_attributes(title: params['title'], # book.rb attributes 
                             author: params['author'],
                             isbn: params['isbn'],
                             library: @library,
                             patron: @patron)
                             # checked_out: params['checked_out'])
    redirect to("/books/#{@book.id}")
  else
    erb :books_edit
  end
end

#### LIBRARIES

# Index
get '/libraries' do
  @libraries = Library.all
  erb :libraries_index
end

# New
get '/libraries/new' do
  @library = Library.new
  erb :libraries_new
end

# Create
post '/libraries' do
  # create insect object
  @library = Library.new(params)

  if @library.save
    redirect to('/libraries')
  else
    erb :libraries_new
  end
end

# Show
get '/libraries/:id' do
  @library = Library.find_by_id(params['id']) # nil or Insect object
  erb :libraries_show
end

# Edit
get '/libraries/:id/edit' do
  @library = Library.find_by_id(params['id']) # nil or Insect object
  erb :libraries_edit
end

# Update
post '/libraries/:id' do
  @library = Library.find_by_id(params['id'])

  if @library.update_attributes(branch_name: params['branch_name'], # library.rb attributes 
                             address: params['address'],
                             phone: params['phone'])
    redirect to("/libraries/#{@library.id}")
  else
    erb :libraries_edit
  end
end


#### Staff Members

# Index
get '/staff_members' do
  @staff_members = StaffMember.all
  erb :staff_members_index
end

# New
get '/staff_members/new' do
  @staff_member = StaffMember.new
  erb :staff_members_new
end

# Create
post '/staff_members' do
  # create insect object
  @staff_member = StaffMember.new(params)

  if @staff_member.save
    redirect to('/staff_members')
  else
    erb :staff_members_new
  end
end

# Show
get '/staff_members/:id' do
  @staff_member = StaffMember.find_by_id(params['id']) # nil or Insect object
  erb :staff_members_show
end

# Edit
get '/staff_members/:id/edit' do
  @staff_member = StaffMember.find_by_id(params['id']) # nil or Insect object
  @libraries = Library.all # staff belongs to Library
  erb :staff_members_edit
end

# Update
post '/staff_members/:id' do
  @staff_member = StaffMember.find_by_id(params['id'])
    @library = Library.find_by_id(params['library_id'])


  if @staff_member.update_attributes(name: params['name'], # staff_member.rb attributes 
                             email: params['email'])
    redirect to("/staff_members/#{@staff_member.id}")
  else
    erb :staff_members_edit
  end
end


#### Patrons

# Index
get '/patrons' do
  @patrons = Patron.all
  erb :patrons_index
end

# New
get '/patrons/new' do
  @patron = Patron.new
  erb :patrons_new
end

# Create
post '/patrons' do
  # create insect object
  @patron = Patron.new(params)

  if @patron.save
    redirect to('/patrons')
  else
    erb :patrons_new
  end
end

# Show
get '/patrons/:id' do
  @patron = Patron.find_by_id(params['id']) # nil or Insect object
  erb :patrons_show
end

# Edit
get '/patrons/:id/edit' do
  @patron = Patron.find_by_id(params['id']) # nil or Insect object

  erb :patrons_edit

end

# Update
post '/patrons/:id' do
  @patron = Patron.find_by_id(params['id'])

  if @patron.update_attributes(name: params['name'], # patron.rb attributes 
                             email: params['email'])
    redirect to("/patrons/#{@patron.id}")
  else
    erb :patrons_edit
  end
end


binding.pry
