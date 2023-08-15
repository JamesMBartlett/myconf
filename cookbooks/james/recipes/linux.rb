if ! platform_family?('debian')
  return
end

apt_update 'update'

apt_pkg_list = [
  'fzf',
  'zsh',
  'ripgrep',
  'fd-find',
]

apt_package apt_pkg_list do
  action :upgrade
end
