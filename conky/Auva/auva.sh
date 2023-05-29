#!/bin/bash
if pacman -Qu | wc -l | grep -q '0';
then
	printf "System is up to date"
elif pacman -Qu | wc -l | grep -q '1';
then
	printf "`pacman -Qu | wc -l` Pkg Update Available"
else
	printf "`pacman -Qu | wc -l` Pkg Updates Available"
fi
