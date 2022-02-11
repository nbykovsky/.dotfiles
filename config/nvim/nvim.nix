{pkgs, config, ...}:
let
  path = toString ./.;
in
{
  enable = true;
  vimAlias = true;
  extraConfig = ''
    luafile ${path}/lua/user/options.lua
    luafile ${path}/lua/user/keymaps.lua
    luafile ${path}/lua/user/nvim-tree.lua
  '';

  plugins = with pkgs.vimPlugins; [
    nvim-web-devicons
    nvim-tree-lua
  ];
}
