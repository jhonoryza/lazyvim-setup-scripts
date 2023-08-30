
#!/bin/bash

# required
rm -rf ~/.config/nvim.bak
mv ~/.config/nvim{,.bak}

# optional but recommended

rm -rf ~/.local/share/nvim.bak
rm -rf ~/.local/state/nvim.bak
rm -rf ~/.cache/nvim.bak

mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

cat plugins/colorscheme.lua >> ~/.config/nvim/lua/plugins/colorscheme.lua
cat plugins/commenter.lua >> ~/.config/nvim/lua/plugins/commenter.lua
cat plugins/disabled.lua >> ~/.config/nvim/lua/plugins/disabled.lua
cat plugins/tab_and_surround.lua >> ~/.config/nvim/lua/plugins/tab_and_surround.lua
cat config/keymaps.lua >> ~/.config/nvim/lua/config/keymaps.lua
cat config/options.lua >> ~/.config/nvim/lua/config/options.lua


nvim


