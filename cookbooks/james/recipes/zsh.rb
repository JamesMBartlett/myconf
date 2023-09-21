remote_file '/tmp/oh-my-zsh-install.sh' do
  source 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh'
  mode '0777'
end

execute 'install oh-my-zsh' do
  command ['sh', '/tmp/oh-my-zsh-install.sh']
  creates "#{node['home_dir']}/.oh-my-zsh/oh-my-zsh.sh"
end

cookbook_file "#{node['home_dir']}/.james.zshrc" do
  owner node['owner']
  group node['group']
  mode '0644'
  source 'james.zshrc'
end

cookbook_file "#{node['home_dir']}/.zshrc" do
  owner node['owner']
  group node['group']
  mode '0644'
  source 'zshrc'
end

remote_binary 'kubectx'
remote_binary 'kubens'

remote_archive 'fzf' do
  path "#{node['home_dir']}/.fzf"
  strip_components 1
end

execute 'Install fzf' do
  command ["#{node['home_dir']}/.fzf/install"]
end
