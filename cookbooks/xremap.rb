%w(bison libx11-dev).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'clone xremap' do
  user "#{node[:linux_user]}"
  command "#{ENV['HOME']}/develop/bin/ghq get https://github.com/k0kubun/xremap"
  not_if "test -d #{ENV['HOME']}/develop/src/github.com/k0kubun/xremap"
end

execute 'make xremap' do
  cwd "#{ENV['HOME']}/develop/src/github.com/k0kubun/xremap"
  command 'make'
  command 'make install'
end
