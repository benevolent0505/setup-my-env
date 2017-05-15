# dependency packages
%w(libgtk2.0-dev libxpm-dev libjpeg-dev libgif-dev libtiff-dev libncurses-dev).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'download emacs.tar.gz' do
  cwd "#{ENV['HOME']}/local/tmp"
  command "wget http://ftp.gnu.org/gnu/emacs/emacs-#{node[:emacs_version]}.tar.gz"
  not_if "test -e emacs-#{node[:emacs_version]}.tar.gz"
end

execute 'extract tar.gz' do
  cwd "#{ENV['HOME']}/local/tmp"
  command "tar zxf emacs-#{node[:emacs_version]}.tar.gz"
  not_if "test -d emacs-#{node[:emacs_version]}"
end

execute 'install emacs' do
  cwd "#{ENV['HOME']}/local/tmp/emacs-#{node[:emacs_version]}"
  command './configure'
  command 'make'
  command 'make install'
  not_if "which emacs"
end
