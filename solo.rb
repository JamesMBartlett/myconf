require 'tmpdir'

current_dir = File.expand_path(File.dirname(__FILE__))

node_path Dir.tmpdir()
file_cache_path Dir.tmpdir()
cookbook_path "#{current_dir}/cookbooks"
