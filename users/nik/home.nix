{ config, pkgs, nvimFlake, ... }:
let
  vimConfig = import ../../config/nvim/default.nix ;
#   powerlevel10k = pkgs.fetchFromGitHub {
#     owner = "romkatv";
#     repo = "powerlevel10k";
#     rev = "b7d90c84671183797bdec17035fc2d36b5d12292";
#     sha256 = "0nzvshv3g559mqrlf4906c9iw4jw8j83dxjax275b2wi8ix0wgmj";
#   };
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
  programs.neovim = vimConfig pkgs;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      cr = "cargo run";
      ct = "cargo test";
      gc = "git commit -am";
      gp = "git push";
      gb = "git checkout -B";
      gs = "git status";
      v  = "nvim";
      au = "~/.dotfiles/apply-users.sh";
      as = "~/.dotfiles/apply-system.sh";
      alacritty = "alacritty --config-file ~/.config/alacritty/alacritty.yaml";
      # update = "sudo nixos-rebuild switch";
    };
    initExtra = ''
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.p10k.zsh
    '';
      
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
  # programs.ssh.startAgent = true; 

  programs.git = {
    enable = true;
    userName  = "Nik Bykovsky";
    userEmail = "nikolay.bykovsky@gmail.com";
    extraConfig = {
      core.editor = "nvim";
    };
  };

  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;    # You can skip this if you want to use the unfree version
    extensions = with pkgs.vscode-extensions; [
      # Some example extensions...
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      matklad.rust-analyzer
    ];
  };
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
    tdesktop
    discord
    fzf
    ripgrep
    dmenu
    polybar
    psmisc
    xclip
    libreoffice
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
 
  home.file.".config/discord/settings.js".source = ../../config/discord/settings.json;
  
  # home.file."powerlevel10k".source = pkgs.fetchFromGitHub {
  #   owner = "romkatv";
  #   repo = "powerlevel10k";
  #   rev = "f07d7baea36010bfa74708844d404517ea6ac473";
  #   sha256 = "0208437mx12rnqwdmw3r9n5w6n8zq1h3y7h1nm8yr92acnxq8rz5";
  # };

  home.file.".p10k.zsh".source = ../../config/p10k/.p10k.zsh;

  home.file.".config/polybar".source = ../../config/polybar;

   # lib.modules.awesome.enable = true; 

  #home.file.".config/nvim".source = ../../config/nvim;

  imports = [
     ../../config/terminator # config for terminator
    #../../config/awesome/awesome.nix
    #../../config/nvim
  ];
}
