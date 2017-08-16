# Path to your oh-my-zsh installation.
export ZSH=/home/remy/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refined"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(pip colored-man-pages httpie vi-mode)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
else
        export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# edit .zshrc everywhere
alias zshconfig="$EDITOR ~/.zshrc"

# previous command with sudo
alias please='sudo $(fc -ln -1)'

# pacaur update alias
alias up='pacaur -Suy --devel --needed'

# enable Ctrl-T for termite
source /etc/profile.d/vte.sh

# 0.01 lag when pressing <ESC>
export KEYTIMEOUT=1

ZSH_THEME_VI_MODE_COMMAND="%{$fg_bold[magenta]%}β%{$reset_color%}"

vi_mode_prompt_info () {
        if [[ ${KEYMAP} = 'vicmd' ]]
        then
                echo $ZSH_THEME_VI_MODE_COMMAND
        fi
}

if [[ $UID == 0 || $EUID == 0 ]]
then
        PROMPT='%(?.$(vi_mode_prompt_info)%{$fg_bold[yellow]%}λ.$(vi_mode_prompt_info)%{$fg_bold[red]%}λ)%f '
else
        PROMPT='%(?.$(vi_mode_prompt_info)%{$fg_bold[green]%}λ.$(vi_mode_prompt_info)%{$fg_bold[red]%}λ)%f '
fi

# INSERT-MODE KEYBINDINGS (overriding key)
bindkey -M viins '\eOH'  beginning-of-line                  # Beginningt
bindkey -M viins '\eOF'  end-of-line                        # End
bindkey -M viins '\e[2~' overwrite-mode                     # Inser
bindkey -M viins '\e[3~' delete-char                        # Suppr
bindkey -M viins '^P' history-beginning-search-backward     # Ctrl-P
bindkey -M viins '^N' history-beginning-search-forward      # Ctrl-N
bindkey -M viins '\eOA' history-beginning-search-backward   # Arrow-Up
bindkey -M viins '\eOB' history-beginning-search-forward    # Arrow-Down

# NORMAL-MODE KEYBINDINGS (overriding key)
bindkey -M vicmd '\eOH'  beginning-of-line                  # Beginning
bindkey -M vicmd '\eOF'  end-of-line                        # End
bindkey -M vicmd '\e[2~' overwrite-mode                     # Inser
bindkey -M vicmd '\e[3~' delete-char                        # Suppr
bindkey -M vicmd '^P' history-beginning-search-backward     # Ctrl-P
bindkey -M vicmd '^N' history-beginning-search-forward       # Ctrl-N
bindkey -M vicmd '\eOA' history-beginning-search-backward   # Arrow-Up
bindkey -M vicmd '\eOB' history-beginning-search-forward    # Arrow-Down

# OPL path
export OPL_PATH=/opt/ibm/ILOG/CPLEX_Studio1263/opl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPL_PATH/bin/x86-64_linux
export PYTHONSTARTUP=/home/remy/.pythonrc

# alias for transfer.sh : transfer your file
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
        tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OPAM configuration
. /home/remy/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
