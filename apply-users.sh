#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.nik.activationPackage
./result/activate
popd
