# Browser Specific


## Chrome
[Nightly builds](https://www.google.com/intl/en/chrome/browser/canary.html)

## WebKit
link to download nightlies

## Safari
*Disable Safari’s thumbnail cache for History and Top Sites*
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

*Enable Safari’s debug menu*
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

*If you have the WebKit browser: Allows you to change homepage*
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true
