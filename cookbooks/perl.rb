directory "#{ENV['HOME']}/.plenv" do
  action :create
end

git "#{ENV['HOME']}/.plenv" do
  repository 'git://github.com/tokuhirom/plenv.git'
end

git "#{ENV['HOME']}/.plenv/plugins/perl-build" do
  repository 'git://github.com/tokuhiromu/Perl-Build'
end

execute 'setup perl' do
  command './plenv/bin/plenv init -'
  command "plenv install #{node[:perl_version]}"
  command "plenv global #{node[:perl_version]}"
  command 'plenv rehash'
  command 'plenv install-cpanm'
end
