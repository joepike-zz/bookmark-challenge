
class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  # belongs_to :link, through => Resource

end
