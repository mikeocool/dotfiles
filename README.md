# Install

```
cd ~
git clone <repo>
./dotfiles/install.sh
```

# Use zsh

Install (if necessary)
```
sudo apt update
sudo apt install zsh
```

Set shell
```
chsh -s $(which zsh)
```

For prompt add to .zshrc:
```
source "${DOTFILES_DIR}/shell/.zsh-prompt"
```
