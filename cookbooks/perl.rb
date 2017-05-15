directory "#{ENV['HOME']}/.plenv" do
  action :create
end

git "#{ENV['HOME']}/.plenv" do
  repository 'git://github.com/tokuhirom/plenv.git'
end

git "#{ENV['HOME']}/.plenv/plugins/perl-build" do
  repository 'git://github.com/tokuhirom/Perl-Build.git'
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
