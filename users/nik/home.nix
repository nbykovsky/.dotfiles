{ config, pkgs, ... }:
let 
  neovimSettings = import ../../config/nvim/nvim.nix;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nik";
  home.homeDirectory = "/home/nik";

  # This setting added automatically
  # Don't touch
  home.stateVersion = "21.11";

  # Enable home-manager
  programs.home-manager.enable = true;
  # Source big modules
  programs.neovim = neovimSettings pkgs;


  home.packages = with pkgs; [
    # neovim
    git
    git-crypt
    gnupg
    lastpass-cli
    terminator
  ];

  imports = [
    ../../config/terminator # config for terminator
  ];
}
