git 'develop/src/github.com/benevolent0505/dotfiles' do
  cwd "/Users/#{node[:user]}"
  repository 'git://github.com/benevolent0505/dotfiles'
end

link '.emacs.d' do
  cwd "/Users/#{node[:user]}"
  link 'develop/src/github.com/benevolent0505/dotfiles/.emacs.d'
end
