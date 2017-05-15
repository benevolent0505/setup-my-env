directory "#{ENV['HOME']}/.plenv" do
  user "#{node[:linux_user]}"
  action :create
end

git "#{ENV['HOME']}/.plenv" do
  user "#{node[:linux_user]}"
  repository 'git://github.com/tokuhirom/plenv.git'
  not_if "test -d #{ENV['HOME']}/.plenv"
end

git "#{ENV['HOME']}/.plenv/plugins/perl-build" do
  user "#{node[:linux_user]}"
  repository 'git://github.com/tokuhirom/Perl-Build.git'
  not_if "test -d #{ENV['HOME']}/.plenv/Perl-Build"
end

# not working
execute 'setup plenv' do
  cwd "#{ENV['HOME']}/.plenv/bin"
  command './plenv init -'
end

# not working
execute 'install perl' do
  cwd "#{ENV['HOME']}/.plenv/bin"
  command "./plenv install #{node[:perl_version]}"
  command "./plenv global #{node[:perl_version]}"
  command './plenv rehash'
  command './plenv install-cpanm'
end
