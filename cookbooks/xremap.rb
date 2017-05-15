%w(bison libx11-dev).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'clone xremap' do
  command "#{ENV['HOME']}/develop/bin/ghq get https://github.com/k0kubun/xremap"
end

execute 'make xremap' do
  cwd "#{ENV['HOME']}/develop/src/github.com/k0kubun/xremap"
  command 'make'
  command 'make install'
end
