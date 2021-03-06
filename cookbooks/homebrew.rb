execute 'Install command line tools' do
  user node[:user]
  command 'xcode-select --install'
  not_if 'test $(xcode-select -p)'
end

execute 'Install Homebrew' do
  user node[:user]
  command 'yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  not_if 'test $(which /usr/local/bin/brew)'
end
