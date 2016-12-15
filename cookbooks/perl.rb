execute 'Install Perl Tools' do
  user node[:user]
  command 'git clone https://github.com/tokuhirom/plenv.git ~/.plenv'
  command 'git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/'
end
