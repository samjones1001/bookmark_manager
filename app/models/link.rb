# require 'data_mapper'
# require 'dm-postgres-adapter'


# This class corresponds to a table in the database
class Link

  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # these property declarations set the column headers in the 'links' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :url,    String

  has n, :tags, :through => Resource

end

# # Now let's set up a connection with a database
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# # Let's check that everything we wrote in our models was OK
# DataMapper.finalize
# # And let's build any new columns or tables we added
# DataMapper.auto_upgrade!
