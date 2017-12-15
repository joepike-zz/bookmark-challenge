require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/tag.rb'

class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String

  # def self.tag_link(link_url, link_title, tag_name, tag_class: Tag)
  #   @tag = tag_class.create(tag: tag_name)
  #   p @tag
  #   @links = Link.create(url: link_url, title: link_title, tag: @tag)
  # end

end

# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV


# @link = Link.create(
#   url: 'http://www.makersacademy.com', title: 'Makers Academy'
# )
