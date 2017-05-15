directory "#{ENV['HOME']}/.pyenv" do
  user "#{node[:linux_user]}"
  action :create
end

git "#{ENV['HOME']}/.pyenv" do
  user "#{node[:linux_user]}"
  repository 'git://github.com/pyenv/pyenv.git'
  not_if "test -d #{ENV['HOME']}/.pyenv"
end
