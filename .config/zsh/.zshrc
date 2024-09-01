# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export JAVA_HOME=/opt/jdk-21.0.3
export LD_LIBRARY_PATH=/usr/lib64

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/third_party/scripts
export PATH=$PATH:"$(brew --prefix coreutils)/libexec/gnubin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git vi-mode zsh-syntax-highlighting zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# vim mode
bindkey -v
export VI_MODE_SET_CURSOR=true

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi-edit='vi .config/nvim/init.lua'
alias hypr-edit='vi .config/hypr/hyprland.conf'
alias Node.js='node'
alias vi='nvim'
alias pom='flatpak run org.gnome.Solanum'
alias ls='ls --color=auto'

# Repo for configs.
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Homebrew setup
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    eval "$(/opt/homebrew/bin/brew shellenv)"
    alias meld="/opt/homebrew/bin/meld"
elif [[ "$OSTYPE" == "fedora"* ]]; then
    # Fedora
    # Add your Fedora specific configurations here
    alias meld="flatpak run org.gnome.meld"
fi

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"
    #'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json')"
fi

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/baral/.config/zsh/.zshrc'

autoload -Uz compinit
compinit -d ${ZDOTDIR}/zcompdump
zstyle ':completion:*' cache-path "${ZDOTDIR}/cache"
## separate files for easier and quicker editing:
for file in $ext_files; do
    [[ -f ${ZDOTDIR}/${file} ]] && source ${ZDOTDIR}/${file}
done
# End of lines added by compinstall

# Load z.sh
[ -f /opt/homebrew/etc/profile.d/z.sh ] && . /opt/homebrew/etc/profile.d/z.sh
