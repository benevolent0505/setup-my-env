directory "#{ENV['HOME']}/.pyenv" do
  action :create
end

git "#{ENV['HOME']}/.pyenv" do
  repository 'git://github.com/yyuu/pyenv.git'
end
