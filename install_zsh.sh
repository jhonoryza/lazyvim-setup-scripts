
#!/bin/bash
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*) machine=Linux ;;
  Darwin*) machine=Mac ;;
  CYGWIN*) machine=Cygwin ;;
  MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac

echo ${machine}

if [ "$machine" == "Mac" ]; then

	#install some depedency
	brew install zsh-autosuggestions zsh-syntax-highlighting

	#install ohmyzsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	#install nvim
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
	mkdir nvim
	mv nvim-macos.tar.gz nvim
	cd nvim
	tar -xvf nvim-macos.tar.gz
	sudo ln -s ~/nvim/nvim-macos/bin/nvim /usr/local/bin/nvim
	cd ../

	#install some ohmyzsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

	#add some alias
	echo "alias vim='nvim'" >>.zshenv
	echo "alias q='exit'" >>.zshenv
	source .zshenv

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

	#install some depedency
	sudo apt-get install make gcc g++ zsh wget vim zsh-autosuggestions zsh-syntax-highlighting

	#install ohmyzsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	#install ohmyzsh
	wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	mkdir nvim
	mv nvim-linux64.tar.gz nvim
	cd nvim
	tar -xvf nvim-linux64.tar.gz
	sudo ln -s ~/nvim/nvim-linux64/bin/nvim /usr/local/bin/nvim
	cd ../

	#install some ohmyzsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

	#add some alias
	echo "alias vim='nvim'" >>.zshenv
	echo "alias q='exit'" >>.zshenv
	source .zshenv

fi
