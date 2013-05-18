#TODO Make this more DRY
#TODO generalize PrefPane installs

pref_dir = "Library/PreferencePanes"
pref_name = 'Witch'
pref_volume = '/Volumes/Witch'
pref_dmg_file = 'witch392.dmg'
pref_source = "http://manytricks.com/download/witch"
pref_checksum = '4ebf6d601ffc6595f6365d95fe919757d14bfe0904b3015a06476b70ce3ab4a3'

global_pref = "/#{pref_dir}/#{pref_name}.prefPane"
local_pref = "Users/#{node['current_user']}/#{pref_dir}/#{pref_name}.prefPane"

if File.exists?(global_pref) || File.exists?(local_pref)
  Chef::Log.warn("#{pref_name} already installed; to upgrade, remove #{pref_dir}/#{pref_name}.prefPane")
else
  remote_file "#{Chef::Config[:file_cache_path]}/#{pref_dmg_file}" do
    source pref_source
    owner node['current_user']
    #user node['current_user']
    checksum pref_checksum
  end

  execute "mount #{pref_dmg_file}" do
    command "hdiutil attach #{Chef::Config[:file_cache_path]}/#{pref_dmg_file}"
    user node['current_user']
    group 'admin'
  end

  execute "copy #{pref_name} to ~/#{pref_dir}" do
    command "cp -r #{pref_volume}/#{pref_name}.prefPane ~/#{pref_dir}"
    user node['current_user']
    group "admin"
  end

  ruby_block "test to see if #{pref_name} was installed" do
    block do
      raise "#{pref_name} was not installed" unless File.exists?(local_pref)
    end
  end

end



