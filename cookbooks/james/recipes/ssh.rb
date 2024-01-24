cookbook_file "#{node['home_dir']}/bin/ssh_tmux" do
  owner node['owner']
  group node['group']
  mode '0755'
  source 'ssh_tmux'
  action :create
end

cookbook_file "#{node['home_dir']}/.ssh/config" do
  owner node['owner']
  group node['group']
  mode '0755'
  source 'ssh_config'
  action :create
end

cookbook_file "#{node['home_dir']}/.ssh/rc" do
  owner node['owner']
  group node['group']
  mode '0755'
  source 'ssh_rc'
  action :create
end
