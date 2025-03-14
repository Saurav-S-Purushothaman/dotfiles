# to enable smooth font in emacs.
defaults write org.gnu.Emacs AppleFontSmoothing -int 1

# uncomment below to remove smooth rendering of emacs
# defaults write org.gnu.Emacs AppleFontSmoothing -int 1

# "Set a blazingly fast keyboard repeat rate, "

defaults write NSGlobalDomain KeyRepeat -int 1
# "Set a shorter Delay until key repeat"

defaults write NSGlobalDomain InitialKeyRepeat -int 10

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
source $(brew --prefix nvm)/nvm.sh
export GOOGLE_CLOUD_PROJECT=unifize-saurav
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 17.0.10)
autoload -Uz compinit && compinit
