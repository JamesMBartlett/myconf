default['user'] = 'james'
default['git_username'] = 'James Bartlett'
default['git_email'] = 'jmabartlett2@gmail.com'

default['home_dir'] = Dir.home(node['user'])

default['pyenv']['url'] = 'https://github.com/pyenv/pyenv/archive/refs/tags/v2.3.24.tar.gz'
default['pyenv']['sha256'] = '3a256f1026644f4ba79812fc7242e0342de5c4d12c6cbf2214c7d1af232e82df'

default['fzf']['url'] = 'https://github.com/junegunn/fzf/archive/refs/tags/0.42.0.tar.gz'
default['fzf']['sha256'] = '743c1bfc7851b0796ab73c6da7db09d915c2b54c0dd3e8611308985af8ed3df2'

default['pyenv-virtualenv']['url'] = 'https://github.com/pyenv/pyenv-virtualenv/archive/refs/tags/v1.2.2.tar.gz'
default['pyenv-virtualenv']['sha256'] = '4736fc833e8c1191f43a897c93fc49e7e815078fd726f832636cc83f1463c30f'
