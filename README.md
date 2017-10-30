# dotfiles
Everyone needs a dotfiles repo, right?

## Info on remaping caps-lock to escape in the terminal

1. Replace /etc/default/keyboard with the contents of etc.default.keyboard from this repo.

2. Run ```bash
sudo dpkg-reconfigure -phigh console-setup
```


