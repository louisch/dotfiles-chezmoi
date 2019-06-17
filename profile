# Path for fresh
export PATH="$PATH:$HOME/bin"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Node
export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="${PATH}:${HOME}/.yarn/bin"

# MacOS specific
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
