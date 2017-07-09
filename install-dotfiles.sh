#!/usr/bin/env bash

dots="git@github.com:robertodr/dots.git"

[ "x$dots" != "x" ] && [ ! -d ~/.dots ] && git clone --recursive $dots ~/.dots

which nix-home 2>&1 >/dev/null
if [ $? != 0 ]; then
    echo "nix-home not found, aborting"
    exit 1
fi

ln -s ~/.dots/default.nix ~/default.nix
nix-home
