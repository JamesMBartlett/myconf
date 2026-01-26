if !platform_family?("mac_os_x")
  return
end

homebrew_update 'update homebrew'

homebrew_package 'wget' do
  homebrew_user node['user']
end
homebrew_package 'zsh' do
  homebrew_user node['user']
end
homebrew_package 'ripgrep' do
  homebrew_user node['user']
end
homebrew_package 'fd' do
  homebrew_user node['user']
end
homebrew_package 'python' do
  homebrew_user node['user']
end
homebrew_package 'go' do
  homebrew_user node['user']
end
homebrew_package 'nodejs' do
  homebrew_user node['user']
end
homebrew_package 'vim' do
  homebrew_user node['user']
end
homebrew_package 'tmux' do
  homebrew_user node['user']
end
homebrew_package 'cmake' do
  homebrew_user node['user']
end
homebrew_package 'gpg2' do
  homebrew_user node['user']
end
homebrew_package 'gnupg' do
  homebrew_user node['user']
end
homebrew_package 'gh' do
  homebrew_user node['user']
end
homebrew_package 'neovim' do
  homebrew_user node['user']
end
#homebrew_package 'derailed/k9s/k9s'
