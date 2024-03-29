remote_directory "#{node['home_dir']}/.vim" do
  mode '0755'
  owner node['owner']
  group node['group']
  source 'vim'
  action :create
end

cookbook_file "#{node['home_dir']}/.vimrc" do
  owner node['owner']
  group node['group']
  mode '0644'
  source 'vimrc'
  action :create
end

vim_plug_cmd = ['curl', '-fLo', "#{node['home_dir']}/.vim/autoload/plug.vim", '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim']
execute 'install vim-plug' do
  command vim_plug_cmd
  creates "#{node['home_dir']}/.vim/autoload/plug.vim"
  user node['user']
end
