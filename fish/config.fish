# Config entirely stolen from @Zynh0722
# Check Obsidian for more info
# 2023-07-15

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Remove the annoying fish greeting
    set fish_greeting

    # Starship config
    function starship_transient_prompt_func
        starship module directory
        starship module character
    end
    starship init fish | source
    enable_transience

    function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
        if test "$argv" = !!
            echo sudo $history[1]
            eval command sudo $history[1]
        else
            command sudo $argv
        end
    end

end

# Allow for creation of nested directories in a single command
alias mkdir 'mkdir -pv'

# File listing conveniences
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'

# Lua or something
alias vi nvim
alias vim nvim

# Moving up directories
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

# Search bash/zsh history
alias histg 'history 1 -1 | grep'

# Get my public ipv4
alias myip 'curl http://ipecho.net/plain; echo'

alias lip 'ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk ''{print $2}'''
alias localip "ifconfig | grep \"inet \" | grep -Fv 127.0.0.1 | awk \'{print $2}\'"

# Move to projects folder
alias projects 'cd ~/Projects'

# Sourcing .venv
alias srcvenv 'source .venv/bin/activate'

# Shortcut for attaching to or creating default tmux session
alias a 'tmux new-session -A'

# ARP Aliases
alias arpnames "arp -a | sed 's/.*(\([.[:digit:]]*\)).*/\1/' | xargs -n1 nslookup"

# Dumb brain Dumb
alias ':q' exit

# Git Log but better
alias githist "git log --graph --decorate --oneline"
