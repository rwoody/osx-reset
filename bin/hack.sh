#!/bin/sh

##
# This is a script with usefull tips taken from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run in interactive mode with:
#   $ sh -c "$(curl -sL https://raw.github.com/gist/2108403/hack.sh)"
#
# or run it without prompt questions:
#   $ sh -c "$(curl -sL https://raw.github.com/gist/2108403/hack.sh)" -s silent
#
# Please, share your tips commenting here:
#   https://gist.github.com/2108403
#
# Author: @DAddYE
# Thanks to: @mathiasbynens
#
case $1 in
  "-s" | "-y" | "--silent" | "silent" )
    echo "Running in silent mode..."
    auto=Y
    shift 1
    ;;
  *)
    auto=N
    if [ ! -t 0 ]; then
      echo "Interactive mode needs terminal!" >&2
      exit 1
    fi
    ;;
esac

function ask {
  while true; do

    if [ "$2" == "Y" ]; then
      prompt="\033[1;32mY\033[0m/n"
      default=Y
    elif [ "$2" == "N" ]; then
      prompt="y/\033[1;32mN\033[0m"
      default=N
    else
      prompt="y/n"
      default=
    fi

    printf "$1 [$prompt] "

    if [ "$auto" == "Y" ]; then
      echo
    else
      read yn
    fi

    if [ -z "$yz" ]; then
      yn=$default
    fi

    case $yn in
      [Yy]*) return 0 ;;
      [Nn]*) return 1 ;;
    esac
  done
}

if ask "Enable subpixel font rendering on non-Apple LCDs (1 light, 2 medium, 3 big)" Y; then
  defaults write NSGlobalDomain AppleFontSmoothing -int 1
fi

if ask "Minimum font size for antialiasing" Y; then
  defaults write NSGlobalDomain AppleAntiAliasingThreshold -int 2
fi

if ask "Sidebar icon size Small" Y; then
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
fi

if ask "Disable menu bar transparency" N; then
  defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
fi

if ask "Always show scrollbars" N; then
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
fi

if ask "Show all filename extensions in Finder" Y; then
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

if ask "Remove slow animations when holding shift" Y; then
  defaults write NSGlobalDomain FXEnableSlowAnimation -bool false
fi

if ask "Expand save panel by default" Y; then
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
fi

if ask "Expand print panel by default" Y; then
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
fi

if ask "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)" Y; then
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
fi

if ask "Display ASCII control characters using caret notation in standard text views" Y; then
  defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true
fi

if ask "Disable press-and-hold for keys in favor of key repeat" Y; then
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi

if ask "Set a blazingly fast keyboard repeat rate" Y; then
  defaults write NSGlobalDomain KeyRepeat -int 0
fi

if ask "Set a shorter Delay until key repeat" Y; then
  defaults write NSGlobalDomain InitialKeyRepeat -int 18
fi

if ask "Disable auto-correct" Y; then
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

if ask "Disable opening and closing window animations" Y; then
  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
fi

if ask "Disable Resume system-wide" Y; then
  defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
fi

if ask "Add a context menu item for showing the Web Inspector in web views" Y; then
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
fi

if ask "Increase window resize speed for Cocoa applications" Y; then
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
fi

if ask "Show remaining battery time; hide percentage" N; then
  defaults write com.apple.menuextra.battery ShowPercent -string "NO"
  defaults write com.apple.menuextra.battery ShowTime -string "YES"
fi

if ask "Allow quitting Finder via ⌘ +Q; doing so will also hide desktop icons" Y; then
  defaults write com.apple.finder QuitMenuItem -bool true
fi

if ask "Disable window animations and Get Info animations in Finder" Y; then
  defaults write com.apple.finder DisableAllAnimations -bool true
fi

if ask "Use current directory as default search scope in Finder" Y; then
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
fi

if ask "Show Path bar in Finder" Y; then
  defaults write com.apple.finder ShowPathbar -bool true
fi

if ask "Show Status bar in Finder" Y; then
  defaults write com.apple.finder ShowStatusBar -bool true
fi

if ask "Allow text selection in Quick Look" Y; then
  defaults write com.apple.finder QLEnableTextSelection -bool true
fi

if ask "Automatically open a new Finder window when a volume is mounted" Y; then
  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
fi

if ask "Display full POSIX path as Finder window title" Y; then
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
fi

if ask "Disable the warning when changing a file extension" Y; then
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
fi

if ask "Remove Dropbox’s green checkmark icons in Finder" Y; then
  file=/Applications/Dropbox.app/Contents/Resources/check.icns
  [ -e "$file" ] && mv -f "$file" "$file.bak"
    unset file
fi

if ask "Show item info below desktop icons" Y; then
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
fi

if ask "Enable snap-to-grid for desktop icons" Y; then
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
fi

if ask "Disable the warning before emptying the Trash" Y; then
  defaults write com.apple.finder WarnOnEmptyTrash -bool false
fi

if ask "Disable shadow in screenshots" Y; then
  defaults write com.apple.screencapture disable-shadow -bool true
fi

if ask "Enable the 2D Dock" N; then
  defaults write com.apple.dock no-glass -bool true
fi

if ask "Automatically hide and show the Dock" Y; then
  defaults write com.apple.dock autohide -bool true
fi

if ask "Minimize effect Suck" Y; then
  defaults write com.apple.dock mineffect -string "suck"
fi

if ask "Make Dock icons of hidden applications translucent" Y; then
  defaults write com.apple.dock showhidden -bool true
fi

if ask "Enable iTunes track notifications in the Dock" Y; then
  defaults write com.apple.dock itunes-notifications -bool true
fi

if ask "Enable highlight hover effect for the grid view of a stack (Dock)" Y; then
  defaults write com.apple.dock mouse-over-hilte-stack -bool true
fi

if ask "Enable spring loading for all Dock items" Y; then
  defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
fi

if ask "Show indicator lights for open applications in the Dock" Y; then
  defaults write com.apple.dock show-process-indicators -bool true
fi

if ask "Don't animate opening applications from the Dock" Y; then
  defaults write com.apple.dock launchanim -bool false
fi

if ask "Set the icon size of the Dock to 36 pixels" Y; then
  defaults write com.apple.dock tilesize -int 36
fi

if ask "Make the animation for showing Dock faster and reduce the delay before it starts" Y; then
  defaults write com.apple.dock autohide-time-modifier -float 0.6
fi

if ask "Remove the delay for showing the Dock in full screen" Y; then
  defaults write com.apple.dock autohide-fullscreen-delayed -bool false
fi

if ask "Minimize in application" Y; then
  defaults write com.apple.dock minimize-to-application -bool true
fi

if ask "Move Dock on the Right" Y; then
  defaults write com.apple.dock orientation -string "right"
fi

if ask "Enable AirDrop over Ethernet and on unsupported Macs running Lion" Y; then
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
fi

if ask "Disable disk image verification" Y; then
  defaults write com.apple.frameworks.diskimages skip-verify -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
fi

if ask "Avoid creating .DS_Store files on network volumes" Y; then
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
fi

if ask "Require password immediately after sleep or screen saver begins" Y; then
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0
fi

if ask "Enable tap to click on Trackpad and login screen" Y; then
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write com.apple.mouse.tapBehaviour -int 1
fi

if ask "Disable Natural Scroll Direction" Y; then
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
fi

if ask "A bit faster Trackpad" Y; then
  defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2
fi

if ask "Disable Safari’s thumbnail cache for History and Top Sites" Y; then
  defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
fi

if ask "Make Safari’s search banners default to Contains instead of Starts With" Y; then
  defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
fi

if ask "Remove useless icons from Safari's bookmarks bar" Y; then
  defaults write com.apple.Safari ProxiesInBookmarksBar "()"
fi

if ask "Enable only Safari resume" Y; then
  defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool true
fi

if ask "Only use UTF-8 in Terminal.app" Y; then
  defaults write com.apple.terminal StringEncodings -array 4
fi

if ask "Disable the Ping sidebar in iTunes" Y; then
  defaults write com.apple.iTunes disablePingSidebar -bool true
fi

if ask "Disable all the other Ping stuff in iTunes" Y; then
  defaults write com.apple.iTunes disablePing -bool true
fi

if ask "Make ⌘ +F focus the search input in iTunes" Y; then
  defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"
fi

if ask "Disable send and reply animations in Mail.app" Y; then
  defaults write com.apple.Mail DisableReplyAnimations -bool true
  defaults write com.apple.Mail DisableSendAnimations -bool true
fi

if ask "Copy email address without brackets" Y; then
  defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
fi

if ask "Disable the 'reopen windows when logging back in' option" Y; then
  # This works, although the checkbox will still appear to be checked.
  defaults write com.apple.loginwindow TALLogoutSavesState -bool false
  defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false
fi

if ask "Enable Dashboard dev mode (allows keeping widgets on the desktop)" Y; then
  defaults write com.apple.dashboard devmode -bool true
fi

if ask "Reset Launchpad" Y; then
  find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
fi

if ask "Show the ~/Library folder" Y; then
  chflags nohidden ~/Library
fi

if ask "Hide the /opt folder" Y; then
  sudo chflags hidden /opt
fi

if ask "Disable local Time Machine backups" Y; then
  hash tmutil &> /dev/null && sudo tmutil disablelocal
fi

if ask "Prevent Time Machine from prompting to use new hard drives as backup volume" Y; then
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
fi

if ask "Kill affected applications" Y; then
  for app in Safari Finder Dock Mail SystemUIServer; do
    killall "$app" >/dev/null 2>&1
  done
  echo
  echo "** \033[33mSome changes needs a reboot to take effect\033[0m **"
  echo
fi
