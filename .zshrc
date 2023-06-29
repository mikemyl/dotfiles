[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ ! -d "$HOME/.fzf" ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
[ ! -d "$HOME/homebrew" ] && mkdir -p $HOME/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
[ ! -d "$HOME/bin" ] && mkdir -p $HOME/bin
[ ! -f "$HOME/bin/logo-ls" ] && cd /tmp/ && curl -O "https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_x86_64.tar.gz"  && tar xf logo-ls_Linux_x86_64.tar.gz && cp logo-ls_Linux_x86_64/logo-ls ~/bin/ && cd ~
[ ! -f "$HOME/bin/bat" ] && cd /tmp/ && curl -O "https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"  && tar xf bat-v0.23.0-x86_64-unknown-linux-gnu.tar.gz && cp bat-v0.23.0-x86_64-unknown-linux-gnu/bat ~/bin/ && cd ~

export PATH="$PATH:$HOME/homebrew/bin"
