#!/bin/bash
# Installer
# Copy the spotifyCli.sh to /usr/bin/TerminalMediaPlayerInfo
# Then source the file and add source command in rc

if [ ! -d "/usr/bin/TerminalMediaPlayerInfo" ]; then
	mkdir /usr/bin/TerminalMediaPlayerInfo
fi
cp $PWD/spotifyCli.sh /usr/bin/TerminalMediaPlayerInfo/
