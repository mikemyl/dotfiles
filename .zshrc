[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ ! -d "$HOME/.fzf" ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
[ ! -d "$HOME/homebrew" ] && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
mkdir -p $HOME/.local/share/bin
[ ! -f "$HOME/.local/share/bin/logo-ls" ] && cd /tmp/ && curl -O "https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_x86_64.tar.gz"  && tar xf logo-ls_Linux_x86_64.tar.gz && cp logo-ls_Linux_x86_64/logo-ls ~/.local/share/bin/ && cd ~
[ ! -f "$HOME/.local/share/bin/bat" ] && cd /tmp/ && curl -O "https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"  && tar xf bat-v0.23.0-x86_64-unknown-linux-gnu.tar.gz && cp bat-v0.23.0-x86_64-unknown-linux-gnu/bat ~/.local/share/bin/ && cd ~


cd ~/Downloads
tb_releases_url='https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release'
download_url=$(curl --silent $tb_releases_url | jq --raw-output '.TBA[0].downloads.linux.link')
curl --output jetbrains-toolbox.tgz --progress-bar --location $download_url
tar xf jetbrains-toolbox.tgz && cd $(find . -type d -name "jetbrains*") && ./jetbrains-toolbox
