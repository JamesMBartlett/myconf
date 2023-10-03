if !platform_family?("mac_os_x")
  return
end

homebrew_package 'wget'
homebrew_package 'zsh'
homebrew_package 'ripgrep'
homebrew_package 'fd'
homebrew_package 'python'
homebrew_package 'go'
homebrew_package 'nodejs'
homebrew_package 'vim'
homebrew_package 'tmux'
homebrew_package 'cmake'
homebrew_package 'gpg2'
homebrew_package 'gnupg'
homebrew_package 'gh'
homebrew_package 'derailed/k9s/k9s'
