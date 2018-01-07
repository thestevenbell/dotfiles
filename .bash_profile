source ~/dotfiles/bash_profile_private
source ~/dotfiles/bash_profile_thd
source ~/dotfiles/bash_profile_system_specific

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-256color"

# from Dr. Mike github https://github.com/drmikeh/bash_prompt
BLACK=$'\e[0;30m'
BRIGHT_BLACK=$'\e[1;30m'

RED=$'\e[0;31m'
BRIGHT_RED=$'\e[1;31m'

GREEN=$'\e[0;32m'
BRIGHT_GREEN=$'\e[1;32m'

YELLOW=$'\e[0;33m'
BRIGHT_YELLOW=$'\e[1;33m'

BLUE=$'\e[0;34m'
BRIGHT_BLUE=$'\e[1;34m'

PURPLE=$'\e[0;35m'
BRIGHT_PURPLE=$'\e[1;35m'

CYAN=$'\e[0;36m'
BRIGHT_CYAN=$'\e[1;36m'

WHITE=$'\e[0;37m'
BRIGHT_WHITE=$'\e[1;37m'

OCHRE=$'\e[38;5;95m'

COLOR_RESET="\033[0m"

# Changes not staged for commit
# Changes to be committed
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Changes to be committed" ]]; then
      echo -e $PURPLE
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  elif [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $CYAN
  else
    echo -e $OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

# Non-printing sequences such as color codes must be
# surrounded by \[ and \] so their lengths are not
# counted as part of the length of the prompt.
function escape_string {
  echo -e "\[$1\]"
}

# functions for controlling Terminal Window and Tab Titles
function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

function tabname2 {
  last2=`pwd | awk -F/ '{print $(NF-1),$(NF)}' | sed "s/ /\//g"`
  tabname $last2
}

# Key:
#   \u  The name of the logged-in user
#   \h  The hostname up to the first '.'
#   \H  The full hostname
#   \d  The current date
#   \T  The current time
#   \n  Newline
#   \$  Shows a $ for a regular user or # for root user

# PS1="\n$(escape_string ${BRIGHT_BLUE})\d \T"       # current date and time
# PS1+="  $(escape_string ${YELLOW})\u@\h"           # user@host
# PS1+="  $(escape_string ${BRIGHT_GREEN})$(free)"   # free memory
PS1="  $(escape_string ${BRIGHT_PURPLE})\w"       # full path
PS1+='$(tabname2)'                                 # set the tab title
PS1+='$(git_color)'                                # colors git status
PS1+=' $(git_branch)'                              # prints current branch
PS1+="\n$(escape_string ${COLOR_RESET})\$ "        # shell prompt
export PS1

# reads the git-completion.bash script which enables autocompletion while using git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export EDITOR='subl -w'
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

alias gw="./gradlew"
