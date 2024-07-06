#!/usr/bin/env bash


if [ "$1" = "docked" ]; then 
    echo "Applying docked workspaces." 
    hyprctl --batch "
    dispatch moveworkspacetomonitor 1 DP-2; 
    dispatch moveworkspacetomonitor 2 DP-2;
    dispatch moveworkspacetomonitor 3 DP-2; 
    dispatch moveworkspacetomonitor 4 DP-2;
    dispatch moveworkspacetomonitor 5 DP-2; 
    dispatch moveworkspacetomonitor 6 DP-2;
    dispatch moveworkspacetomonitor 7 DP-2; 
    dispatch moveworkspacetomonitor 8 DP-2;
    dispatch moveworkspacetomonitor 9 DP-2; 
    dispatch moveworkspacetomonitor 10 DP-2;
    dispatch moveworkspacetomonitor 11 eDP-1; 
    dispatch moveworkspacetomonitor 12 eDP-1;
    dispatch moveworkspacetomonitor 13 eDP-1; 
    dispatch moveworkspacetomonitor 14 eDP-1;
    dispatch moveworkspacetomonitor 15 eDP-1; 
    dispatch moveworkspacetomonitor 16 eDP-1;
    dispatch moveworkspacetomonitor 17 eDP-1; 
    dispatch moveworkspacetomonitor 18 eDP-1;
    dispatch moveworkspacetomonitor 19 eDP-1; 
    dispatch moveworkspacetomonitor 20 eDP-1;

    keyword workspace 1, monitor:DP-2, default; 
    keyword workspace 2, monitor:DP-2; 
    keyword workspace 3, monitor:DP-2; 
    keyword workspace 4, monitor:DP-2; 
    keyword workspace 5, monitor:DP-2; 
    keyword workspace 6, monitor:DP-2; 
    keyword workspace 7, monitor:DP-2; 
    keyword workspace 8, monitor:DP-2; 
    keyword workspace 9, monitor:DP-2; 
    keyword workspace 10, monitor:DP-2; 

    keyword workspace 11, monitor:eDP-1, default; 
    keyword workspace 12, monitor:eDP-1; 
    keyword workspace 13, monitor:eDP-1; 
    keyword workspace 14, monitor:eDP-1; 
    keyword workspace 15, monitor:eDP-1; 
    keyword workspace 16, monitor:eDP-1; 
    keyword workspace 17, monitor:eDP-1; 
    keyword workspace 18, monitor:eDP-1; 
    keyword workspace 19, monitor:eDP-1; 
    keyword workspace 20, monitor:eDP-1; 
    "
elif [ "$1" = "laptop" ]; then
    echo "Applying laptop workspaces." 
    hyprctl --batch "
    dispatch moveworkspacetomonitor 1 eDP-1, default; 
    dispatch moveworkspacetomonitor 2 eDP-1;
    dispatch moveworkspacetomonitor 3 eDP-1; 
    dispatch moveworkspacetomonitor 4 eDP-1;
    dispatch moveworkspacetomonitor 5 eDP-1; 
    dispatch moveworkspacetomonitor 6 eDP-1;
    dispatch moveworkspacetomonitor 7 eDP-1; 
    dispatch moveworkspacetomonitor 8 eDP-1;
    dispatch moveworkspacetomonitor 9 eDP-1; 
    dispatch moveworkspacetomonitor 10 eDP-1;
    dispatch moveworkspacetomonitor 11 eDP-1; 
    dispatch moveworkspacetomonitor 12 eDP-1;
    dispatch moveworkspacetomonitor 13 eDP-1; 
    dispatch moveworkspacetomonitor 14 eDP-1;
    dispatch moveworkspacetomonitor 15 eDP-1; 
    dispatch moveworkspacetomonitor 16 eDP-1;
    dispatch moveworkspacetomonitor 17 eDP-1; 
    dispatch moveworkspacetomonitor 18 eDP-1;
    dispatch moveworkspacetomonitor 19 eDP-1; 
    dispatch moveworkspacetomonitor 20 eDP-1;



    keyword workspace 1, monitor:eDP-1; 
    keyword workspace 2, monitor:eDP-1; 
    keyword workspace 3, monitor:eDP-1;
    keyword workspace 4, monitor:eDP-1;
    keyword workspace 5, monitor:eDP-1; 
    keyword workspace 6, monitor:eDP-1; 
    keyword workspace 7, monitor:eDP-1;
    keyword workspace 8, monitor:eDP-1;
    keyword workspace 9, monitor:eDP-1;
    keyword workspace 10, monitor:eDP-1;

    keyword workspace 11, monitor:eDP-1; 
    keyword workspace 12, monitor:eDP-1; 
    keyword workspace 13, monitor:eDP-1; 
    keyword workspace 14, monitor:eDP-1; 
    keyword workspace 15, monitor:eDP-1; 
    keyword workspace 16, monitor:eDP-1; 
    keyword workspace 17, monitor:eDP-1; 
    keyword workspace 18, monitor:eDP-1; 
    keyword workspace 19, monitor:eDP-1; 
    keyword workspace 20, monitor:eDP-1; 
    "
else
    echo "Invalid param."
fi
