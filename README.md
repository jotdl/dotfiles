# Installing

If you're not curl bash'ing are you even a real developer?
```
curl  -sSL https://git.io/jotdl | bash
```

## Using

```
chezmoi init --apply --verbose https://github.com/jotdl/dotfiles.git 
#or
chezmoi init --apply --verbose git@github.com:jotdl/dotfiles.git
```

## creating curl bash
Use git.io or your favorite shortener and point to the bootstrap/setup script in your dotfiles repo:
```
curl -i https://git.io -F "url=https://raw.githubusercontent.com/jotdl/dotfiles/master/setup.sh" -F code=jotdl
```
## Notes

use the curl | bash above to INSTALL basic things like homebrew & chezmoi, maybe git, etc.  Then let chezmoi do what it does best with the `run_once_install-packages.sh` script which gets run when you do your first `apply`.

## Credits

Heavily based on https://github.com/bketelsen/dotfiles.git : [Video Walkthrough on Youtube](https://www.youtube.com/watch?v=HXx6ugA98Qo)