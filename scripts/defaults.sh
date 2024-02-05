#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
#
# Base
#
# ====================

# Remap the emoji picker to the Fn key
defaults write com.apple.HIToolbox AppleFnUsageType -int 2

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always display scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Use the Fn key as a standard function key
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 2

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Timing to start key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Enable three-finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true && \
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true


# ====================
#
# DesktopServices
#
# ====================

# Do not create .DS_Store files on USB or network storage
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ====================
#
# Dock
#
# ====================

# Disable waiting time before the Dock is displayed
defaults write com.apple.dock autohide-delay -float 0

# Disable animation at application launch
# defaults write com.apple.dock launchanim -bool false

# Highlight hidden apps in the Dock
defaults write com.apple.Dock showhidden -bool YES

defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock autohide -bool true

# ====================
#
# Finder
#
# ====================


# Disable animation
# defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true


# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# ====================
#
# Terminal
#
# ====================

# Use UTF-8 only
defaults write com.apple.terminal StringEncodings -array 4

## remap caps lock key to control (need os restart)
# keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
# defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
# <dict>
#   <key>HIDKeyboardModifierMappingDst</key>\
#   <integer>30064771300</integer>\
#   <key>HIDKeyboardModifierMappingSrc</key>\
#   <integer>30064771129</integer>\
# </dict>
# "

for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

