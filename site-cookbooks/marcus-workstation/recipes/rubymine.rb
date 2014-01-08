dmg_package "RubyMine" do
  volumes_dir "RubyMine"
  source "http://download.jetbrains.com/ruby/RubyMine-6.0.2.dmg"
  checksum "b4ea1f3b7f5b7e70135a7c2f54a12cb5bc61776bbde7cbf6bbe3dd6a233f7b15"
  action :install
  owner node['current_user']
end