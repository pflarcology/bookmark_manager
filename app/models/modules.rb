module DatamapperSetup

  def dm_setup
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

end
