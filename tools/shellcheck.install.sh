#!/bin/sh
set -o errexit
set -o nounset
scversion="stable" # or "v0.4.7", or "latest"
os_arch="$(uname -m)"
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.${os_arch?}.tar.xz" | tar -xJv
sudo cp "shellcheck-${scversion}/shellcheck" /usr/local/bin/
sudo chmod +x /usr/local/bin/shellcheck
rm -rf "shellcheck-${scversion}"
