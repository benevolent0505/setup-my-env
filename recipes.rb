include_recipe './cookbooks/homebrew.rb'
include_recipe './cookbooks/packages.rb'

include_recipe './cookbooks/perl.rb'
include_recipe './cookbooks/ruby.rb'
include_recipe './cookbooks/node.rb'

include_recipe './cookbooks/dotfiles.rb'
include_recipe './cookbooks/settings.rb'
