cookbook_file "#{node['home_dir']}/bin/ssh_tmux" do
  owner node['owner']
  group node['group']
  mode '0755'
  source 'ssh_tmux'
  action :create
end
