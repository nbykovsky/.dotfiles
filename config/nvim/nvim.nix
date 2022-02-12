{pkgs, config, ...}:
let
  path = toString ./.;
  project-nvim-cust = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2022-01-19";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "cef52b8da07648b750d7f1e8fb93f12cb9482988";
      sha256 = "1qwpp0a8llx437jms3ghx8wrc5rwnrkh52xp24ysymqr4lc1xfq6";
    };
    meta.homepage = "https://github.com/ahmedkhalf/project.nvim/";
  };
  impatient-nvim-cust = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-01-18";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "4df4e9360975a8be6e7a7270466fedfd1adcc5b6";
      sha256 = "082ir4kslphx06x1fgyw31nc2yifx3x3p2233sjqibjjjzj0qafh";
    };
    meta.homepage = "https://github.com/lewis6991/impatient.nvim/";
  };
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
    bufferline-nvim
    vim-bbye
    lualine-nvim
    toggleterm-nvim
    project-nvim-cust
    impatient-nvim-cust
    indent-blankline-nvim
    FixCursorHold-nvim
    which-key-nvim 
    
    vim-code-dark

    # cmp plugins
    nvim-cmp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp_luasnip
    cmp-nvim-lsp
    
    luasnip
    friendly-snippets

    nvim-lspconfig
    null-ls-nvim

    telescope-nvim

    nvim-treesitter
    nvim-ts-context-commentstring

    gitsigns-nvim

    nvim-dap
  ];
}
