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

default['gh']['url'] = 'https://github.com/cli/cli/releases/download/v2.35.0/gh_2.35.0_linux_amd64.tar.gz'
default['gh']['sha256'] = '927614fbc6b391d136504ff2cc4b406f7082a2159ea51feb6f1db4fe6033feaa'

default['k9s']['url'] = 'https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz'
default['k9s']['sha256'] = 'e507831ebd5f9b8c0380f212669f352c6e34cb760c916b498babae8be83c4392'
