# go tools
execute 'install go tools' do
  command 'go get -u golang.org/x/tools'
  command 'go get -u github.com/nsf/gocode'
  command 'go get -u github.com/golang/lint'
  command 'go get -u github.com/motemen/ghq'
end

# tex settings
execute 'setting tex' do
  user 'root'
  command 'tlmgr update --self --all'
  command 'tlmgr install collection-langjapanese'
end
