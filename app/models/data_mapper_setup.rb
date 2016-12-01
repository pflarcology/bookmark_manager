require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './link'
require_relative './tag'


def setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
  DataMapper.finalize
end
