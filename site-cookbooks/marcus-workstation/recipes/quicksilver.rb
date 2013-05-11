dmg_package "Quicksilver" do
  volumes_dir "Quicksilver Installer"
  source "http://qsapp.com/download.php"
  checksum "0afb16445d12d7dd641aa8b2694056e319d23f785910a8c7c7de56219db6853c"
  action :install
  owner node['current_user']
end
