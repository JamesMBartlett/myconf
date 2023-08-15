bash 'setup git aliases' do
  code <<-EOH
    git config --global alias.co checkout
    git config --global alias.s status
    git config --global alias.sed '! git grep -z --full-name -l '.' | xargs -0 sed -i -e'
  EOH
end

execute 'git user' do
  command ['git', 'config', '--global', 'user.name', node['git_username']]
end

execute 'git email' do
  command ['git', 'config', '--global', 'user.email', node['git_email']]
end

execute 'git default main branch' do
  command ['git', 'config', '--global', 'init.defaultBranch', 'main']
end
