cookbook_file "#{node['home_dir']}/.tmux.conf" do
  owner node['owner']
  group node['group']
  mode '0644'
  source 'tmux.conf'
end

directory "#{node['home_dir']}/.tmux/plugins" do
  owner node['owner']
  group node['group']
  mode '0755'
  action :create
  recursive true
end

git 'TPM' do
  repository 'https://github.com/tmux-plugins/tpm.git'
  revision 'v3.1.0'
  destination "#{node['home_dir']}/.tmux/plugins/tpm"
  user node['owner']
  group node['group']
  action :sync
end
