cookbook_file "#{node['home_dir']}/.tmux.conf" do
  owner node['user']
  group node['user']
  mode '0644'
  source 'tmux.conf'
end
