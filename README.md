# TODO - July 2015

* Read: [How to write a good readme](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme)
* Organize the information into better categories. Mabye:
** Description:
*** Why?
*** How?
** Steps for setting up
** Supposedly Frequently Asked Questions
*** How do i uninstall?

*Note things that are probably out of date
* Review install steps and note security risks

# osx-reset

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
* [Robomongo](http://robomongo.org/)
* [TinkerTool](http://www.bresink.com/osx/TinkerTool.html)

### Paid
* [1Password](https://agilebits.com/onepassword)
* [Bartender](http://www.macbartender.com/)
* [Stats App](http://bjango.com/mac/istatmenus/)
* [kaleidoscope diff tool](http://www.kaleidoscopeapp.com/)
* [Moom](http://manytricks.com/moom/)

## [Install Homebrew](brew.sh)

## [Install Homebrew Cask](http://caskroom.io/)
* brew cask install barmaid
* brew cask install spotify
* brew cask install boot2docker
* brew cask install caffeine
* brew cask install firefox
* brew cask install evernote
* brew cask install alfred

Paid
* brew cask install 1password
* brew cask install codekit

This allows you to download standard GUI applications via the command line.

* google-chrome
* firefox
* etc

## Shell Stuff

### Git

```bash
ssh-keygen -t rsa -C "me@gmail.com"

#copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "OSX Reset"
git config --global user.email "reset@apple.com"
git config --global github.user osx-reset
git config --global github.token SUPER_SECRET

git config --global core.editor "subl3 -n -w"
git config --global color.ui true
```

