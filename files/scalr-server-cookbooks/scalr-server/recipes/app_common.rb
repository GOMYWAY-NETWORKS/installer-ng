# user

user node[:scalr_server][:app][:user] do
  home   "#{node[:scalr_server][:install_root]}/embedded/scalr"
  shell  '/bin/sh'  # TODO - Needed?
  system true
end


# Scalr system directories

directory "#{scalr_bundle_path node}/app/cache" do
  owner     node[:scalr_server][:app][:user]
  group     node[:scalr_server][:app][:user]
  mode      0770
  recursive true
end

directory "#{scalr_bundle_path node}/app/etc" do
  owner     'root'
  group     'root'
  mode      0755
  recursive true
end

# Scalr config files

template "#{scalr_bundle_path node}/app/etc/config.yml" do
  source 'config.yml.erb'
  owner   'root'
  group   node[:scalr_server][:app][:user]
  mode    0640
end

file "#{scalr_bundle_path node}/app/etc/.cryptokey" do
  content node[:scalr_server][:app][:secret_key]
  owner   'root'
  group   node[:scalr_server][:app][:user]
  mode    0640
end

file "#{scalr_bundle_path node}/app/etc/id" do
  content node[:scalr_server][:app][:id]
  owner   'root'
  group   node[:scalr_server][:app][:user]
  mode    0640
end


# TODO - Might as well be in a enable_web recipe, but... not a big deal for now.
# TODO - Session GC cron when web is enabled!!
# PHP sessions dir
directory "#{run_dir_for node, 'php'}/sessions" do
  owner     node[:scalr_server][:app][:user]
  group     node[:scalr_server][:app][:user]
  mode      0775
  recursive true
end

# PHP errors log dir
directory log_dir_for(node, 'php') do
  owner     node[:scalr_server][:app][:user]
  group     node[:scalr_server][:app][:user]
  mode      0755
  recursive true
end


# PHP configuration
# TODO - Consider updating php to drop this into /etc/php, not /embedded/etc/php

directory "#{node[:scalr_server][:install_root]}/embedded/etc/php" do
  owner     'root'
  group     'root'
  mode      0755
  recursive true
end

template "#{node[:scalr_server][:install_root]}/embedded/etc/php/php.ini" do
  source    'php/php.ini.erb'
  owner     'root'
  group     'root'
  mode      0644
  helpers(Scalr::PathHelper)
end