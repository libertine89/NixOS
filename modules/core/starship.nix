{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.starship = {
        enable = true;
        settings = {
          format = "[░▒▓](#a3aed2)[ 󱄅 ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$fill[ ]$git_branch$git_status(fg:#5D6D9E bg:#4A567D)[]$nodejs$bun$rust$golang$php(fg:#4A567D bg:#394260)[]$time[▓▒░](fg:#212736)\n$character";
          #format = "[░▒▓](#a3aed2)[ 󱄅 ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)";
          #right_format = "$git_branch$git_status(fg:#5D6D9E bg:#4A567D)$nodejs$bun$rust$golang$php(fg:#4A567D bg:#394260)$time[▓▒░](fg:#212736)\n$character";

          directory = {
          style = "fg:#e3e5e5 bg:#769ff0";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          };

          directory.substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
          };
          
          git_branch = {
          symbol = "";
          style = "bg:#394260";
          format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
          };

          git_status = {
          style = "bg:#394260";
          format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
          };

          nodejs = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
          };

          bun = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
          };

          rust = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
          };

          golang = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
          };
          
          php = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
          };
          
          time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#1d2230";
          format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
          };
          #username = {
          #  style_user = "green bold";
          #  style_root = "red bold";
          #  format = "[$user]($style)";
          #  disabled = false;
          #  show_always = true;
          #};
          # hostname = {
          #   ssh_only = false;
          #   format = " on [$hostname](bold red)\n";
          #   disabled = false;
          # };
          character = {
            success_symbol = "[❯](#FF6AC1)";
            error_symbol = "[❯](#FF5C57)";
            vimcmd_symbol = "[❮](bright-green)";
          };
          cmd_duration = {
            format = "[$duration]($style) ";
            style = "yellow";
          };
          aws = {
            symbol = "aws ";
          };
          azure = {
            symbol = "az ";
          };
          cmake = {
            symbol = "cmake ";
          };
          deno = {
            symbol = "deno ";
          };
          docker_context = {
            symbol = "docker ";
          };
          lua = {
            symbol = "lua ";
          };
          memory_usage = {
            symbol = "memory ";
          };
          nim = {
            symbol = "nim ";
          };
          nix_shell = {
            symbol = "❄️ ";
            format = "[$symbol]($style)";
          };

          shell = {
            disabled = false;
            style = "cyan";
            bash_indicator = "";
            powershell_indicator = "";
          };

          os.symbols = {
            Alpaquita = "alq ";
            Alpine = "alp ";
            Amazon = "amz ";
            Android = "andr ";
            Arch = "rch ";
            Artix = "atx ";
            CentOS = "cent ";
            Debian = "deb ";
            DragonFly = "dfbsd ";
            Emscripten = "emsc ";
            EndeavourOS = "ndev ";
            Fedora = "fed ";
            FreeBSD = "fbsd ";
            Garuda = "garu ";
            Gentoo = "gent ";
            HardenedBSD = "hbsd ";
            Illumos = "lum ";
            Linux = "lnx ";
            Mabox = "mbox ";
            Macos = "mac ";
            Manjaro = "mjo ";
            Mariner = "mrn ";
            MidnightBSD = "mid ";
            Mint = "mint ";
            NetBSD = "nbsd ";
            NixOS = "󱄅 ";
            OpenBSD = "obsd ";
            OpenCloudOS = "ocos ";
            openEuler = "oeul ";
            openSUSE = "osuse ";
            OracleLinux = "orac ";
            Pop = "pop ";
            Raspbian = "rasp ";
            Redhat = "rhl ";
            RedHatEnterprise = "rhel ";
            Redox = "redox ";
            Solus = "sol ";
            SUSE = "suse ";
            Ubuntu = "ubnt ";
            Unknown = "unk ";
            Windows = "win ";
          };
          package = {
            symbol = "pkg ";
          };
          purescript = {
            symbol = "purs ";
          };
          python = {
            format = "[$virtualenv]($style) ";
            style = "bright-black";
            symbol = "py ";
          };
          status = {
            symbol = "[x](bold red) ";
          };
          sudo = {
            symbol = "sudo ";
          };
          terraform = {
            symbol = "terraform ";
          };
          zig = {
            symbol = "zig ";
          };
        };
      };
    })
  ];
}
