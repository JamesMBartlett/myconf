remote_directory "#{node['home_dir']}/.config/nvim" do
  mode '0755'
  owner node['owner']
  group node['group']
  source 'nvim'
  action :create
end

tree_sitter_cmd = ["#{node['home_dir']}/.cargo/bin/cargo", 'install', 'tree-sitter-cli', '--root', "#{node['home_dir']}"]
execute 'install tree-sitter-cli' do
  command tree_sitter_cmd
  creates "#{node['home_dir']}/bin/tree-sitter"
  user node['user']
  environment ({
    'HOME' => node['home_dir'],
    'USER' => node['user']
  })
end
