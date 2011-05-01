role_path     File.expand_path("../../chef/roles", __FILE__)
cookbook_path File.expand_path("../../chef/cookbooks", __FILE__)

file_store_path File.expand_path("../..", __FILE__)
file_cache_path File.expand_path("../..", __FILE__)

log_level :debug
Chef::Log::Formatter.show_time = true