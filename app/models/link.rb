require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end

p ENV['RACK_ENV']
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!

@link = Link.create(
  url: 'http://www.makersacademy.com', title: 'Makers Academy'
)
