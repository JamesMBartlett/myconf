rustup_init = "#{node['home_dir']}/.cargo/bin/rustup"

bash 'install_rustup_for_user' do
  user node['user']
  group node['group']
  environment(
    'HOME' => node['home_dir'],
    'USER' => node['user']
  )
  cwd node['home_dir']
  code <<-EOH
    curl https://sh.rustup.rs -sSf | sh -s -- -y
  EOH
  not_if { ::File.exist?(rustup_init) }
end
