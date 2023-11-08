CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
NVIM=$CONFIG_HOME/nvim
NVIM_SWAP=$CONFIG_HOME/nvim.swp

mkdir -p $NVIM
git clone https://github.com/Nikitat0/nvim.git $NVIM_SWAP &&
git --work-tree=$NVIM --git-dir=$NVIM_SWAP/.git stash push --include-untracked
rm $NVIM
mv $NVIM_SWAP $NVIM
