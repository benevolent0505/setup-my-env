%w(autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev).each do |pkg|
  package pkg do
    action :install
  end
end

directory "#{ENV['HOME']}/.rbenv" do
  action :create
end

git "#{ENV['HOME']}/.rbenv" do
  repository 'git://github.com/rbenv/rbenv'
  not_if "test -d #{ENV['HOME']}/.rbenv"
end

git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository 'git://github.com/rbenv/ruby-build'
  not_if "test -d #{ENV['HOME']}/.rbenv/plugins/ruby-build"
end

# not working
execute 'setup rbenv' do
  cwd "#{ENV['HOME']}/.rbenv/bin"
  command './rbenv init -'
end

# not working
execute 'install ruby' do
  cwd "#{ENV['HOME']}/.rbenv/bin"
  command "./rbenv install #{node[:ruby_version]}"
  command "./rbenv global #{node[:ruby_version]}"
  command './rbenv rehash'
end
