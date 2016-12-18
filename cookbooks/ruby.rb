directory "#{ENV['HOME']}/.rbenv" do
  action :create
end

git "#{ENV['HOME']}/.rbenv" do
  repository 'git://github.com/rbenv/rbenv'
end

git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository 'git://github.com/rbenv/ruby-build'
end

execute './rbenv/bin/rbenv init -'

execute 'setup ruby' do
  command './rbenv/bin/rbenv init'
  command "rbenv install #{node[:ruby_version]}"
  command "rbenv global #{node[:ruby_version]}"
  command 'rbenv rehash'
end
