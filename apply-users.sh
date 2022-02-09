#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/nik/home.nix
popd
