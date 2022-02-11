{pkgs, config, ...}:
let
  path = toString ./.;
in
{
  enable = true;
  vimAlias = true;
  extraConfig = ''
    luafile ${path}/lua/user/options.lua
  '';

  plugins = with pkgs.vimPlugins; [

  ];
}
