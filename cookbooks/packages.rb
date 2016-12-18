node[:brew][:repositories].each do |repo|
  execute 'brew tap' do
    user node[:user]
    command "brew tap #{repo}"
  end
end

execute 'Install Java' do
  command 'brew install cask java'
  not_if 'test -e $(which /usr/bin/java)'
end

node[:brew][:install_packages].each do |package|
  execute "Install #{package}" do
    user node[:user]
    command "brew install #{package}"
    not_if "test $(brew list | grep #{package})"
  end
end

# 以下個別に処理をする必要のあるもの
execute 'Install MySQL 5.5' do
  user node[:user]
  command 'brew install mysql55 --force'
  not_if "test $(brew list | grep mysql@5.5)"
end

node[:brew][:install_cask_packages].each do |package|
  execute "Install #{package}" do
    user node[:user]
    command "brew cask install #{package}"
    not_if "test $(brew cask list | grep #{package})"
  end
end

execute 'cleanup' do
  command 'brew cleanup'
  command 'brew cask cleanup'
end
