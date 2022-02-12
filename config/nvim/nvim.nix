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
    luafile ${path}/lua/user/colorscheme.lua
  '';

  plugins = with pkgs.vimPlugins; [
    popup-nvim
    plenary-nvim
    nvim-autopairs
    comment-nvim
    nvim-web-devicons
    nvim-tree-lua
    vim-code-dark
  ];
}
