dmg_package "GoogleNotifier" do
  volumes_dir "Google Notifier 1.10.7"
  source "https://dl.google.com/mac/install/GoogleNotifier.dmg"
  checksum "055775cb02773e4ec0e133111c7720134d32bb8d3a1f747231dc0c7d4078f5f7"
  action :install
  owner node['current_user']
end