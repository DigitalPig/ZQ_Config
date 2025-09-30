# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/digitalpig/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git battery terraform doctl python kubectl fzf 
    kubectx podman ubuntu skaffold vscode direnv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
#
# Old Bash Profile

# Setup for Spark
SPARK_HOME=/opt/spark
export PATH=/home/digitalpig/.local/bin:/snap/bin:$SPARK_HOME/bin:/opt/zeppelin/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
# Spark OPTS can change
#export SPARK_OPTS='--jars /home/digitalpig/Coding/xgboost/jvm-packages/xgboost4j-spark/target/xgboost4j-spark-0.7-jar-with-dependencies.jar' 
export PYSPARK_PYTHON=python3
#export PYSPARK_DRIVER_PYTHON=jupyter
#export PYSPARK_DRIVER_PYTHON_OPTS="console"
#export SPARK_SUBMIT_OPTIONS=$SPARK_OPTS
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Julia thread setting
export JULIA_NUM_THREADS=3
#alias docker="podman"
alias python="python3"

# Julia MXNet setup
#export MXNET_HOME=$HOME/Codes/incubator-mxnet
#export LD_LIBRARY_PATH=$HOME/Codes/incubator-mxnet/build:/usr/lib:$LD_LIBRARY_PATH
#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so:$LD_PRELOAD

# Spark Conf
SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:/opt/zeppelin/bin:$PATH #:/opt/gurobi/linux64/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
# Spark OPTS can change
#export SPARK_OPTS='--jars /home/digitalpig/Coding/xgboost/jvm-packages/xgboost4j-spark/target/xgboost4j-spark-0.7-jar-with-dependencies.jar --packages ai.h2o:sparkling-water-package_2.11:2.2.10' 
export PYSPARK_PYTHON=/opt/anaconda3/bin/python
#export PYSPARK_DRIVER_PYTHON=/opt/anaconda3/bin/jupyter
#export PYSPARK_DRIVER_PYTHON_OPTS="console"
export SPARK_SUBMIT_OPTIONS=$SPARK_OPTS


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/linuxbrew/.linuxbrew/Cellar/vault/1.3.4/bin/vault vault

# Some alias
alias sicp="racket -l r5rs -l sicp --repl"

# Gurobi Setup
export GUROBI_HOME="/opt/gurobi/linux64"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vi=nvim

# PKG-config path
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig/:/usr/share/pkgconfig:/usr/lib/pkgconfig

export QT_IM_MODULE=fcitx

#export FZF_BASE=/home/linuxbrew/.linuxbrew/bin/

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/digitalpig/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#

# Import the tokens
if [ -f ~/.tokens ]; then
    source ~/.tokens
else
    print "404: ~/.tokens not found."
fi



. "$HOME/.cargo/env"
export PATH=/home/digitalpig/.pixi/bin:$PATH


eval "$(direnv hook zsh)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/digitalpig/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/digitalpig/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
alias conda=micromamba
alias mamba=micromamba
alias lg=lazygit

# Aider related configuration

export AIDER_DARK_MODE=true
export AIDER_ARCHITECT=true
export AIDER_MODEL="openrouter/google/gemini-2.5-pro-preview-03-25"
#export AIDER_EDITOR_MODEL="openrouter/anthropic/claude-3.7-sonnet"

eval "$(pay-respects zsh --alias)"

kimi() {
    (
        export ANTHROPIC_BASE_URL=https://api.moonshot.ai/anthropic
        export ANTHROPIC_AUTH_TOKEN=$KIMI_API_KEY
        claude "$@"
    )
}

zai() {
    (
        export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
        export ANTHROPIC_AUTH_TOKEN=$Z_API_KEY
        claude "$@"
    )
}

dseek() {
    (
        export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
        export ANTHROPIC_AUTH_TOKEN=${DEEPSEEK_API_KEY}
        export ANTHROPIC_MODEL=deepseek-chat
        export ANTHROPIC_SMALL_FAST_MODEL=deepseek-chat
        export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
        claude "$@"
    )
}

alias nvide=$HOME/.local/bin/neovide.AppImage

# opencode
export PATH=/home/digitalpig/.opencode/bin:$PATH
export EDITOR=neovim
