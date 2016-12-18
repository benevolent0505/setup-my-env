directory "#{ENV['HOME']}/.ndenv" do
  action :create
end

git "#{ENV['HOME']}/.ndenv" do
  repository 'git://github.com/riywo/ndenv'
end

git "#{ENV['HOME']}/.ndenv/plugins/node-build" do
  repository 'git://github.com/nodenv/node-build'
end

execute 'setup nodejs' do
  command './ndenv/bin/ndenv init -'
  command "ndenv install #{node[:node_version]}"
  command 'ndenv rehash'
end
