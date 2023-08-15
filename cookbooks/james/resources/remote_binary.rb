unified_mode true
provides :remote_binary

property :name, String, name_property: true
property :binary_path_in_tar, String, default: ''
property :binary_name, String, default: ''
property :strip_components, Integer, default: 0
default_action :create

action :create do
  home_dir = node['home_dir'] 
  base_dir = "#{home_dir}/tools"
  extract_dir = "#{base_dir}/#{new_resource.name}"
  bin_dir = "#{home_dir}/bin"

  directory base_dir do
    owner node['user']
    group node['user']
    mode '0755'
    action :create
  end

  directory extract_dir do
    owner node['user']
    group node['user']
    mode '0755'
    action :create
  end

  directory bin_dir do
    owner node['user']
    group node['user']
    mode '0755'
    action :create
  end

  binary_path = "#{extract_dir}/#{new_resource.name}"
  sha256 = node[new_resource.name]['sha256']

  url = node[new_resource.name]['url']
  if url.end_with?("tar.gz")
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
  
    if ! new_resource.binary_path_in_tar.empty?
      binary_path = "#{extract_dir}/#{new_resource.binary_path_in_tar}"
    end
  else
    remote_file binary_path do
      source url
      mode '0755'
      checksum sha256 
    end
  end

  link_path = "#{bin_dir}/#{new_resource.name}"
  if ! new_resource.binary_name.empty?
    link_path = "#{bin_dir}/#{new_resource.binary_name}"
  end

  link link_path do
    to binary_path
    link_type :symbolic
    owner node['user']
    group node['user']
    action :create
  end
end
