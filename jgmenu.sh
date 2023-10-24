#!/bin/bash

if [ -f ~/.jgmenu-lockfile ]; then
	rm ~/.jgmenu-lockfile; sleep 0.001;
	jgmenu --config-file=~/.config/jgmenu/white-theme
	exit 0	
else
	jgmenu --config-file=~/.config/jgmenu/white-theme
	exit 0
fi


