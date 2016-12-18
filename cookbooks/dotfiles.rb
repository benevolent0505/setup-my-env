git "#{ENV[HOME]}/develop/src/github.com/benevolent0505/dotfiles" do
  repository 'git://github.com/benevolent0505/dotfiles'
end

link "#{ENV[HOME]}/.emacs.d" do
  to 'develop/src/github.com/benevolent0505/dotfiles/.emacs.d'
  not_if 'test -d .emacs.d'
end

link "#{ENV[HOME]}/.bashrc" do
  to 'develop/src/github.com/benevolent0505/dotfiles/config/.bashrc'
  not_if 'test -e .bashrc'
end

link "#{ENV[HOME]}/.config/fish/config.fish" do
  to 'develop/src/github.com/benevolent0505/dotfiles/config/config.fish'
  not_if 'test -e .config/fish/config.fish'
end
