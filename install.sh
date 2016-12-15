#!/bin/sh
set -e

# download mitamae
curl -o "mitamae" -fL https://github.com/k0kubun/mitamae/releases/download/v1.2.2/mitamae-x86_64-darwin
chmod +x "mitamae"

./mitamae local -y nodes.yml recipes.rb
