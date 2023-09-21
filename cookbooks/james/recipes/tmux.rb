cookbook_file "#{node['home_dir']}/.tmux.conf" do
  owner node['owner']
  group node['group']
  mode '0644'
  source 'tmux.conf'
end
