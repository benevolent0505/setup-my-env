execute 'install ruby' do
  user node[:user]
  command 'git clone https://github.com/rbenv/rbenv.git ~/.rbenv'
  command 'git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build'
end
