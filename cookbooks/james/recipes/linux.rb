if ! platform_family?('debian')
  return
end

apt_update 'update'

apt_pkg_list = [
  'build-essential',
  'libssl-dev',
  'zlib1g-dev',
  'libbz2-dev',
  'libreadline-dev',
  'libsqlite3-dev',
  'curl',
  'libncursesw5-dev',
  'xz-utils',
  'tk-dev',
  'libxml2-dev',
  'libxmlsec1-dev',
  'libffi-dev',
  'liblzma-dev',
  'zsh',
  'ripgrep',
  'fd-find',
]

apt_package apt_pkg_list do
  action :upgrade
end

remote_binary 'gh' do
  binary_path_in_tar 'bin/gh'
  strip_components 1
end

remote_binary 'k9s'

link "#{node['home_dir']}/bin/fd" do
  to '/usr/bin/fdfind'
  owner node['owner']
  group node['group']
end
