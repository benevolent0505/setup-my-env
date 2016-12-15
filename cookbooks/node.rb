execute 'install node.js' do
  user node[:user]
  command 'git clone https://github.com/riywo/ndenv ~/.ndenv'
  command 'git clone https://github.com/nodenv/node-build.git ~./ndenv/plugins/node-build'
end
