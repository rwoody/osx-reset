# osx-dev-install

A smart way to get your new OSX development machine up and running.

This project makes that easier.

## Why?
- **You constantly screw things up.** You are a learner and/or hacker. [Debugging](http://lmgtfy.com/) always sucks. Just ``reset --hard HEAD`` instead.
- **Your computer was just stolen.** You just need to get up and running -- you're not a *(necessarily)* quitter.

In any of these scenarios, it's very common for people to do something along these lines, in no specific order:

- Download applications as they remember what apps they used to have.
- Setup command line tools willy-nilly, unless they had maintained some [.dotfiles](http://dotfiles.github.io/).


- - -

# The Goods

## Download Applications

### Free

* [Alfred](http://www.alfredapp.com/)
* [Chrome](http://www.chromium.org/getting-involved/dev-channel)
* [Firefox](http://www.mozilla.org/en-US/firefox/beta/)
* [Webkit](http://webkit.org)
* [Opera](http://www.opera.com/browser/next/)
* [iTerm](http://iterm2.com)
* [FileZilla](http://filezilla-project.org/download.php)
* [Sublime Text](http://www.sublimetext.com/dev)
* [LiveReload](http://livereload.com)
* [LiveReload Extensions](http://help.livereload.com/kb/general-use/browser-extensions)
* [Sequel Pro](http://www.sequelpro.com/)

### Paid
* [1Password](https://agilebits.com/onepassword)
* [Bartender](http://www.macbartender.com/)
* [Stats App](http://bjango.com/mac/istatmenus/)
* [kaleidoscope diff tool](http://www.kaleidoscopeapp.com/)
* [Moom](http://manytricks.com/moom/)

## You must first:

*If you need Xcode* download it through the [App Store](https://itunes.apple.com/us/app/xcode/id497799835) and download the `Command Line Tools` afterwards:

`Xcode > Preferences > Downloads > Command Line Tools`

*Screw Xcode!* Install GCC and/or other necessary tools as you see fit with [OSX GCC Installer](https://github.com/kennethreitz/osx-gcc-installer) [1](http://kennethreitz.org/xcode-gcc-and-homebrew/)

## Install Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

## Shell Stuff

### Git

```bash
ssh-keygen -t rsa -C "g3dinua@gmail.com"

#copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "Bohdan Viter"
git config --global user.email "g3dinua@gmail.com"
git config --global github.user g3d
git config --global github.token your_token_here

git config --global core.editor "subl3 -n -w"
git config --global color.ui true
```

### .dotfiles

Clone and install your `.dotfiles` from Github to `~/`

### Node Version Manager ([nvm](https://github.com/creationix/nvm#install-script))
```bash
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

### Ruby Version Manager ([rvm](https://rvm.io/))
```bash
curl -L https://get.rvm.io | bash -s stable
```

## OS X Preferences

```bash
### Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

### Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

### Enable you to hold a key for repeating it
defaults write -g ApplePressAndHoldEnabled -bool false

### Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

### Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

### Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

### Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

*Disable disk image verification*
See [this](http://www.tuaw.com/2008/08/18/terminal-tip-stop-disk-image-verification/) for an explanation.
defaults write com.apple.frameworks.diskimages skip-verify -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

### Add a context menu item for showing the Web Inspector for Safari/WebKit
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

### Show the ~/Library folder
chflags nohidden ~/Library

### Big save menu always
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true






```bash
brew install git ack wget curl memcached libmemcached readline sqlite gdbm pkg-config
```


## Python
------------
1. Install with Homebrew
```bash
brew install python --framework
```
2. You may need to:
```bash
export PATH=/usr/local/share/python:$PATH
```
