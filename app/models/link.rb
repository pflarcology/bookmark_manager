require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './modules'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
end

include DatamapperSetup

setup
