module DatamapperSetup

  def setup
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

end
