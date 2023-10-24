#!/bin/bash

TEXT_VIEWER=$(echo "" | dmenu -l 0 -p "Specify your text viewer: ") 
USER=$(cd && pwd)
ARGS=$(echo "" | dmenu -l 0 -p "Have your text viewer any args to open? (if not, press ENTER): ")
LANGUAGE=$(export LANG=ru_RU.UTF-8) 
BOOKS_DIRECTORY=$(echo "" | dmenu -l 0 -p "Your library path: " )

CHOSEN_BOOK=$(ls $BOOKS_DIRECTORY | dmenu -l 10) 

$TEXT_VIEWER $ARGS $BOOKS_DIRECTORY/$CHOSEN_BOOK
