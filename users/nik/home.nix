{ config, pkgs, nvimFlake, ... }:
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
  programs.neovim = nvimFlake.vimConfig;


  home.packages = with pkgs; [
    # neovim
    git
    git-crypt
    gnupg
    lastpass-cli
    terminator
    alacritty
  ];

  home.file.".config/alacritty/alacritty.yaml".source = ../../config/alacritty/alacritty.yaml;
  home.file.".config/awesome/rc.lua".source = ../../config/awesome/rc.lua;
  
   # lib.modules.awesome.enable = true; 
 
  imports = [
    ../../config/terminator # config for terminator
  ];
}
