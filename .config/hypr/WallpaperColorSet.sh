#!/bin/bash 

sleep 0.3 & swww img --transition-type fade $1 
wallust run $1
killall waybar; waybar & disown

