remote_binary 'pyenv' do
  binary_path_in_tar 'bin/pyenv' 
  strip_components 1
end

pyenv_root = archive_path('pyenv')

remote_archive 'pyenv-virtualenv' do
  path "#{pyenv_root}/plugins/pyenv-virtualenv"
  strip_components 1
end
