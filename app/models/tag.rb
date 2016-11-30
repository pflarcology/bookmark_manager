require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './modules'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

end

include DatamapperSetup

dm_setup
