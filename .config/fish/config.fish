set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch --gpu-hide-type integrated
end
