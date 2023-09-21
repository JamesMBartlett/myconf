if ! platform_family?('debian')
  return
end

default['owner'] = node['user']
default['group'] = node['user']

default['kubectx']['url'] = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx_v0.9.5_linux_x86_64.tar.gz'
default['kubectx']['sha256'] = 'a2247ffd23e79f89abdd0e8173379d7172511f02a3f63c9936d3824e0dd60648'

default['kubens']['url'] = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubens_v0.9.5_linux_x86_64.tar.gz'
default['kubens']['sha256'] = 'acc1a9c7f6b722fbe5fad25dd0e784a7335d18436b9c414ab996629e82702cba'

default['bazelisk']['url'] = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.18.0/bazelisk-linux-amd64'
default['bazelisk']['sha256'] = 'ce52caa51ef9e509fb6b7e5ad892e5cf10feb0794b0aed4d2f36adb00a1a2779'
