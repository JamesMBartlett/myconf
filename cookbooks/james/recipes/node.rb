nvm_dir = "#{node['home_dir']}/.nvm"

bash 'install_nvm_and_node' do
  user node['user']
  group node['group']
  environment(
    'HOME' => node['home_dir'],
    'USER' => node['user']
  )
  code <<-EOH
    export NVM_DIR="#{nvm_dir}"
    if [ ! -d "$NVM_DIR" ]; then
      git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
      cd "$NVM_DIR" && git checkout v0.39.7
    fi
    . "$NVM_DIR/nvm.sh"
    nvm install 20
    nvm alias default 20
  EOH
  not_if { ::File.exist?("#{nvm_dir}/nvm.sh") }
end
