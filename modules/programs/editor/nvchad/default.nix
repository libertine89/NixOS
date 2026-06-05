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
            {
              "sindrets/diffview.nvim",
              dependencies = { "nvim-tree/nvim-web-devicons" },
              keys = {
                {
                  "<leader>mt",
                  function()
                    local view = require("diffview.lib").get_current_view()
                    if view then
                      vim.cmd("DiffviewClose")
                    else
                      vim.cmd("DiffviewOpen")
                    end
                  end,
                  desc = "Toggle Diffview",
                },

                -- Accept All Changes Binds are leader co, ct, cb
                -- Diff Ours
                {
                  "<leader>do",
                  "<cmd>diffget OURS<cr>",
                  desc = "Diff Get Local (Ours)",
                },
                -- Diff Theirs
                {
                  "<leader>dt",
                  "<cmd>diffget THIERS<cr>",
                  desc = "Diff Get Remote (Theirs)",
                },
                -- Diff Base
                {
                  "<leader>db",
                  "<cmd>diffget BASE<cr>",
                  desc = "Diff Get Base",
                },
              },

              -- Settings for DiffView Layout
              config = function()
                require("diffview").setup({
                    view = {
                      merge_tool = {
                        layout = "diff3_mixed",
                        disable_diagnostics = true,
                      },
                    },
                  })
                end,
            },
            {
              "NeogitOrg/neogit",
              dependencies = {
                "sindrets/diffview.nvim",
              },
              cmd = "Neogit",
              keys = {
                {
                  "<leader>sc",
                  "<cmd>Neogit<cr>",
                  desc = "Toggle Neogit",
                }
              },
              config = function()
                require("neogit").setup({})
              end,
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
      xdg.configFile."nvim/lua/plugins/init-1.lua".text =
        import ./conf/init-1.nix { };
      xdg.configFile."nvim/lua/themes/onedark_neon.lua".text =
        import ./conf/onedark_neon.nix { };
    })
  ];
}
