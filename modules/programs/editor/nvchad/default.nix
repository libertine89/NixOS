{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    (_: {
      imports = [ inputs.nvchad4nix.homeManagerModule ];
      programs.nvchad = {
        enable = true;
        extraPlugins = ''
          return {
            {
              "Sly-Harvey/radium.nvim",
              priority = 1000,
            },
            {
              "nvim-lualine/lualine.nvim",
              dependencies = { "nvim-tree/nvim-web-devicons" },
            },
          }

        '';
        extraPackages = with pkgs; [
           nixd
           vscode-langservers-extracted
           lua-language-server
           rust-analyzer
           pyright
           typescript-language-server
           bash-language-server
           gopls
        ];
        hm-activation = true;
        backup = false;
      };

      # Import Config files
      xdg.configFile."nvim/lua/options.lua".text =
        import ./conf/options.nix { };
      xdg.configFile."nvim/lua/mappings.lua".text =
        import ./conf/mappings.nix { };
      xdg.configFile."nvim/lua/autocmds.lua".text =
        import ./conf/autocmds.nix { };
      xdg.configFile."nvim/lua/configs/lspconfig.lua".text =
        import ./conf/lspconfig.nix { };
      xdg.configFile."nvim/lua/chadrc.lua".text =
        import ./conf/chadrc.nix { };
      xdg.configFile."nvim/lua/configs/lualine.lua".text =
        import ./conf/lualine.nix { };
    })
  ];
}
