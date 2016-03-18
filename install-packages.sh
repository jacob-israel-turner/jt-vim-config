PACKAGES=("https://github.com/scrooloose/nerdtree" "https://github.com/altercation/vim-colors-solarized" "https://github.com/pangloss/vim-javascript" "https://github.com/mxw/vim-jsx" "https://github.com/othree/yajs.vim")
if [ ! -d "bundle" ]; then
  mkdir bundle
fi
cd bundle
for i in ${PACKAGES[@]}
do
  git clone $i
done
