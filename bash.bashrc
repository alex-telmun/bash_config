# ~/.bashrc
## Shell common settings

# Correct minor errors in the spelling of a directory component in a cd command
shopt -s cdspell

# Correct minor errors in the spelling of a directory component during word completion
shopt -s dirspell

# Lists the status of any stopped and running jobs before exiting an shell
shopt -s checkjobs

# Append commands to the history file, without overwrite it
shopt -s histappend

# Check terminal size and refresh LINES before command
shopt -s checkwinsize

# Lines which begin with a space character are not saved in the history list
# Lines matching the previous history entry to not be saved
export HISTCONTROL=ignoreboth

# Format history entry to print the timestamp in strftime format
export HISTTIMEFORMAT="%d.%m.%y %T> "

# The number of commands to remember in the command history. -1 every command being saved
export HISTSIZE=-1

# The maximum number of lines contained in the history file
export HISTFILESIZE=500000

# Ignore commands in history
export HISTIGNORE="ls:pwd:clear"

### WTF??? ###
# For X
#if [ "$DISPLAY" ]; then
  #xset -dpms                              # Disable DPMS (Enargy Star Technology)
  #xset s off                              # Disable screensaver
  #xset b off                              # Disable beeper
#fi
### WTF!!! ###

## ENV settings
export TERM="xterm-256color"
export EDITOR="vim"
export ALTERNATE_EDITOR="nano"
export VISUAL="vim"
export PAGER="less"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
BASH_CONF_DIR=/etc/bashrc.d
BASH_CONF_FILES="
                aliases
                functions
                prompt

                "
# Source included configs
for config in ${BASH_CONF_FILES}
do
  [[ -f "${BASH_CONF_DIR}/${config}" ]] && . ${BASH_CONF_DIR}/${config}
done

# You can put anything to .bash_env (e.g. private aliases)
[[ -f ~/.bash_env ]] && . ~/.bash_env

# Display beautiful system information
[[ -f /usr/bin/alsi ]] && alsi -n -t -u -c1=white -c2=blue
# Uncomment if used neofetch
#[[ -f /usr/bin/neofetch ]] && neofetch --config /etc/neofetch/config

### WTF??? ###
#if ! ssh-add -l 1>/dev/null 2>&1
#then
  #[[ -f ~/.ssh/id_rsa.pub ]] && ssh-add
#fi
### WTF!!! ###

# sudo autocomplete
#complete -cf sudo
# vi:syntax=sh
# vi:ft=sh

