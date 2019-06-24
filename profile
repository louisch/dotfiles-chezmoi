# Path for fresh
export PATH="${PATH}:${HOME}/bin"

# Android
case `uname` in
  Darwin)
    export ANDROID_HOME=${HOME}/Library/Android/Sdk
    ;;
  Linux)
    export ANDROID_HOME=${HOME}/Android/Sdk
    ;;
esac
export PATH="${PATH}:${ANDROID_HOME}/emulator"
export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/tools/bin"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"

# Node
export PATH="${HOME}/.node_modules/bin:${PATH}"
export PATH="${PATH}:${HOME}/.yarn/bin"

# Python
export PATH="${PATH}:${HOME}/.local/bin"

# Ruby
export PATH="${PATH}:${HOME}/.gem/ruby/2.6.0/bin:/usr/local/lib/ruby/gems/2.6.0/bin/"
export PATH="/usr/local/opt/ruby/bin:${PATH}"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# MacOS specific
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"


export EDITOR="nvim"
