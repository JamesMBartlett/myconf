unified_mode true
provides :remote_archive

property :name, String, name_property: true
property :path, String, default: ''
property :strip_components, Integer, default: 0
default_action :create

action :create do
  home_dir = node['home_dir']
  base_dir = "#{home_dir}/tools"
  extract_dir = "#{base_dir}/#{new_resource.name}"

  if !new_resource.path.empty?
    extract_dir = new_resource.path
  else
    directory base_dir do
      owner node['owner']
      group node['group']
      mode '0755'
      action :create
    end
  end

  directory extract_dir do
    owner node['owner']
    group node['group']
    mode '0755'
    action :create
  end

  url = node[new_resource.name]['url']
  sha256 = node[new_resource.name]['sha256']

  tmp_archive = "/tmp/#{new_resource.name}.tar.gz"
  remote_file tmp_archive do
    source url
    mode '0755'
    checksum sha256
  end

  extract_cmd = ['tar', 'xzf', tmp_archive, '-C', extract_dir, '--strip-components', "#{new_resource.strip_components}"]
  execute "extract #{new_resource.name}" do
    command extract_cmd
  end
end
