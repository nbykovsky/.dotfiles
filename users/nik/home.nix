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


  # programs.ssh.startAgent = true; 

  home.packages = with pkgs; [
    # neovim
    git
    git-crypt
    gnupg
    lastpass-cli
    terminator
    alacritty
    firefox
    nitrogen
    compton
    #picom
  ];

  home.file.".config/alacritty/alacritty.yaml".source = ../../config/alacritty/alacritty.yaml;
  
  home.file.".config/awesome/rc.lua".source = ../../config/awesome/rc.lua;

  home.file.".config/awesome/awesome-wm-widgets".source = pkgs.fetchFromGitHub {
    owner = "streetturtle";
    repo = "awesome-wm-widgets";
    rev = "b8e3a861f4829b2c3820e9a40294a3d9125fbf23";
    sha256 = "1y3bbxczzrqk1d2636rc0z76x8648vf3f78dwsjwsy289zmby3dq";
  };

  home.file.".config/wallpapers".source = ../../config/wallpapers;
  
   # lib.modules.awesome.enable = true; 
 
  imports = [
     ../../config/terminator # config for terminator
    #../../config/awesome/awesome.nix
  ];
}
