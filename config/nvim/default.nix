{pkgs, ...}:
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
  darkplus-nvim-cust = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "darkplus.nvim";
    version = "2022-01-18";
    src = pkgs.fetchFromGitHub {
      owner = "lunarvim";
      repo = "darkplus.nvim";
      rev = "8044a5fcee1b501350864af3215b0a37fca21fdf";
      sha256 = "18lq8m44c929jwndk4x403qfs1xfj8jwb3pdj5y2xj3hinlqc60v";
    };
    meta.homepage = "https://github.com/LunarVim/darkplus.nvim/";
  };
  rust-cust = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "rust.vim";
    version = "2022-01-18";
    src = pkgs.fetchFromGitHub {
      owner = "rust-lang";
      repo = "rust.vim";
      rev = "4aa69b84c8a58fcec6b6dad6fe244b916b1cf830";
      sha256 = "07nh8gvkwq91i7qcz0rk5jlc8sb4d3af4zq2892kmmw576zg1wd8";
    };
    meta.homepage = "https://github.com/rust-lang/rust.vim/";
  };
in
{
  enable = true;
  vimAlias = true;
  # extraConfig = ''
  #   luafile ${path}/lua/user/options.lua
  #   luafile ${path}/lua/user/keymaps.lua
  #   luafile ${path}/lua/user/colorscheme.lua
  #   luafile ${path}/lua/user/cmp.lua
  #   luafile ${path}/lua/user/telescope.lua
  #   luafile ${path}/lua/user/treesitter.lua
  #   luafile ${path}/lua/user/autopairs.lua
  #   luafile ${path}/lua/user/comment.lua
  #   luafile ${path}/lua/user/gitsigns.lua
  #   luafile ${path}/lua/user/nvim-tree.lua
  #   luafile ${path}/lua/user/bufferline.lua
  #   luafile ${path}/lua/user/lualine.lua
  #   luafile ${path}/lua/user/toggleterm.lua
  #   luafile ${path}/lua/user/project.lua
  #   luafile ${path}/lua/user/impatient.lua
  #   luafile ${path}/lua/user/indentline.lua
  #   luafile ${path}/lua/user/dap.lua
  #   luafile ${path}/lua/user/whichkey.lua
  #   luafile ${path}/lua/user/autocommands.lua
  #   luafile ${path}/lua/user/lsp/init.lua
  #   luafile ${path}/lua/user/lsp/handlers.lua
  #   " luafile ${path}/lua/user/lsp/null-ls.lua
  # '';
  extraConfig = ''
    luafile ${path}/lua/user/options.lua
    luafile ${path}/lua/user/keymaps.lua
    luafile ${path}/lua/user/colorscheme.lua
    luafile ${path}/lua/user/cmp.lua
    luafile ${path}/lua/user/autopairs.lua
    luafile ${path}/lua/user/indentline.lua
    luafile ${path}/lua/user/lsp/init.lua
    " luafile ${path}/lua/user/lsp/handlers.lua
    " luafile ${path}/lua/user/lsp/null-ls.lua
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
    # toggleterm-nvim
    project-nvim-cust
    impatient-nvim-cust
    indent-blankline-nvim
    FixCursorHold-nvim
    #which-key-nvim 
    
    # vim-code-dark
    darkplus-nvim-cust 

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

    #telescope-nvim

    nvim-treesitter
    nvim-ts-context-commentstring

    gitsigns-nvim

    nvim-dap

    rust-cust
  ];
}
