dmg_package "VMware Fusion" do
  volumes_dir "VMware Fusion/"
  source "http://download2us.softpedia.com/dl/5728857913226b6f31d2ae31ec4dbb2e/5197a89b/400024122/mac/System-Utilities/VMware-Fusion-5.0.3-1040386-light.dmg"
  checksum "540355352cac92bf52aef1db393da75e573f3ad036d9edc51df3f7f2e140c0dd"
  action :install
  owner node['current_user']
end
