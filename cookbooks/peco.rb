directory "#{ENV['HOME']}/local/bin" do
  user "#{node[:linux_user]}"
  action :create
end

execute 'download peco' do
  user "#{node[:linux_user]}"
  cwd "#{ENV['HOME']}/local/tmp"
  command "wget https://github.com/peco/peco/releases/download/v#{node[:peco_version]}/peco_linux_amd64.tar.gz"
  not_if 'test -e peco_linux_amd64.tar.gz'
end

execute 'extract peco' do
  user "#{node[:linux_user]}"
  cwd "#{ENV['HOME']}/local/tmp"
  command "tar zxf peco_linux_amd64.tar.gz"
  not_if 'test -d peco_linux_amd64'
end

execute 'install peco' do
  user "#{node[:linux_user]}"
  cwd "#{ENV['HOME']}/local/tmp"
  command "mv peco_linux_amd64/peco #{ENV['HOME']}/local/bin/"
  not_if 'which peco'
end
