bash 'setup git aliases' do
  code <<-EOH
    git config --global alias.co checkout
    git config --global alias.s status
    git config --global alias.sed '! git grep -z --full-name -l '.' | xargs -0 sed -i -e'
  EOH
  user node['user']
  environment ({'HOME' => "#{node['home_dir']}"})
end

execute 'git user' do
  command ['git', 'config', '--global', 'user.name', node['git_username']]
  user node['user']
  environment ({'HOME' => "#{node['home_dir']}"})
end

execute 'git email' do
  command ['git', 'config', '--global', 'user.email', node['git_email']]
  user node['user']
  environment ({'HOME' => "#{node['home_dir']}"})
end

execute 'git default main branch' do
  command ['git', 'config', '--global', 'init.defaultBranch', 'main']
  user node['user']
  environment ({'HOME' => "#{node['home_dir']}"})
end
