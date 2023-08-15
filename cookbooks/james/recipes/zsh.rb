execute 'install oh-my-zsh' do
  command ['sh', '-c', '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)']
  creates "#{node['home_dir']}/.oh-my-zsh/oh-my-zsh.sh"
end

cookbook_file "#{node['home_dir']}/.james.zshrc" do
  owner node['user']
  group node['user']
  mode '0644'
  source 'james.zshrc'
end

cookbook_file "#{node['home_dir']}/.zshrc" do
  owner node['user']
  group node['user']
  mode '0644'
  source 'zshrc'
end

remote_binary 'kubectx'
remote_binary 'kubens'
