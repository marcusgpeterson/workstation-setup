execute "tap phinze/homebrew-cask" do
  command "brew tap phinze/homebrew-cask"
  not_if { system("brew tap | grep 'cask' > /dev/null 2>&1") }
end

package "brew-cask"

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  group 'staff'
end
