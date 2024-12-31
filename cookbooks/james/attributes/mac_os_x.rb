if ! platform_family?('mac_os_x')
  return
end

default['owner'] = node['user']
default['group'] = 'wheel'

default['kubectx']['url'] = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx_v0.9.5_darwin_arm64.tar.gz'
default['kubectx']['sha256'] = '1ea0dff5c6e7ebbe77b9e689c8b4ca17e8406b36fea88bfc221fefc25ae71a60'

default['kubens']['url'] = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubens_v0.9.5_darwin_arm64.tar.gz'
default['kubens']['sha256'] = 'c87651906e0d45ff4bf49924102147c2aec66bac1e07859924ee1a0294cb36d0'

default['bazelisk']['url'] = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.18.0/bazelisk-darwin-arm64'
default['bazelisk']['sha256'] = '82b35ce200a390bf90af65c6814245b279213d88589d733bea5f288742a2feee'

default['bzl']['url'] = 'https://get.bzl.io/darwin_arm64/bzl'
