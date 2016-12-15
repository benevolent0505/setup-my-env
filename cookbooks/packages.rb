execute 'install xcode commandline tools' do
  command 'xcode-select --install'
end

node[:brew][:repositories].each do |repo|
  execute 'brew tap' do
    user node[:user]
    command "brew tap #{repo}"
  end
end

node[:brew][:install_packages].each do |package|
  execute "Install #{package}" do
    user node[:user]
    command "brew install #{package}"
  end
end

# 以下個別に処理をする必要のあるもの
execute 'Install MySQL 5.5' do
  user node[:user]
  command 'brew install mysql55 --force'
end

node[:brew][:install_cask_packages].each do |package|
  execute "Install #{package}" do
    user node[:user]
    command "brew cask install #{package}"
  end
end
