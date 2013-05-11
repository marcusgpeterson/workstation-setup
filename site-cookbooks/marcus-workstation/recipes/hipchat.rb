app_name = "HipChat"
app_url = "http://downloads.hipchat.com.s3.amazonaws.com/mac-beta/HipChat-0.32-01uennzomg01wmg.zip"

if File.exists?("/Applications/#{app_name}.app")
  log "#{app_name} already installed; to upgrade, remove /Applications/#{app_name}.app"
else
  remote_file "#{Chef::Config[:file_cache_path]}/#{app_name}.zip" do
    source app_url
    owner node['current_user']
    checksum "c0c291011741164e21abd8acf5480cc5656b2b112b3ff4e56f49a4675fd6d130"
  end

  execute "unzip HipChat" do
    command "unzip #{Chef::Config[:file_cache_path]}/#{app_name}.zip -d #{Chef::Config[:file_cache_path]}/"
    user node['current_user']
  end

  execute "copy HipChat to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/#{app_name}.app #{Regexp.escape("/Applications/#{app_name}.app")}"
    user node['current_user']
    group "admin"
  end

  ruby_block "test to see if HipChat.app was installed" do
    block do
      raise "#{app_name}.app was not installed" unless File.exists?("/Applications/#{app_name}.app")
    end
  end
end