node.default["textmate"]["url"] = "https://github.com/textmate/textmate/releases/download/v2.0-alpha.9501/TextMate_2.0-alpha.9501.tbz"
node.default["textmate"]["shasum"] = "c9493661bb23ecf46dccc1eebefcf57df3d8e6a121c4ca71e7db70d7a28572a4"

unless File.exists?("/Applications/TextMate.app")
  directory Chef::Config[:file_cache_path] do
    action :create
    recursive true
  end

  remote_file "#{Chef::Config[:file_cache_path]}/TextMate.tbz" do
    source node["textmate"]["url"]
    checksum node["textmate"]["shasum"]
    owner node['current_user']
  end

  execute "extract text mate to /Applications" do
    command "tar -xjf #{Chef::Config[:file_cache_path]}/TextMate.tbz -C /Applications/"
    user node['current_user']

    # This is required to unzip into Applications
    group "admin"
  end

  execute "link textmate" do
    command "ln -s /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate"
    not_if "test -e /usr/local/bin/mate"
  end

  ruby_block "test to see if TextMate was installed" do
    block do
      raise "TextMate install failed" unless File.exists?("/Applications/TextMate.app")
    end
  end
end

execute "link textmate" do
  command "ln -s /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate"
  not_if "test -e /usr/local/bin/mate"
end