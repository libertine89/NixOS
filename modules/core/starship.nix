{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.starship = {
        enable = true;
        settings = {
          format = "[░▒▓](#a3aed2)[ 󱄅 ](bg:#a3aed2 fg:#212736)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0)$fill[](fg:#788BC4 )$git_branch$git_status[](fg:#5D6D9E bg:#788BC4)$nodejs$bun$rust$golang$php[](fg:#4A567D bg:#5D6D9E)$time[▓▒░](fg:#4A567D)\n$character";

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
          
          fill = {
            symbol = " ";
          };

          git_branch = {
          symbol = "";
          style = "bg:#788BC4";
          format = "[[ $symbol $branch ](fg:#212736 bg:#788BC4)]($style)";
          };

          git_status = {
          style = "bg:#788BC4";
          format = "[[($all_status$ahead_behind)](fg:#212736 bg:#788BC4)]($style)";
          };

          nodejs = {
          symbol = "";
          style = "bg:#5D6D9E";
          format = "[[ $symbol ($version) ](fg:#394260 bg:##5D6D9E)]($style)";
          };

          bun = {
          symbol = "";
          style = "bg:#5D6D9E";
          format = "[[ $symbol ($version) ](fg:#394260 bg:##5D6D9E)]($style)";
          };

          rust = {
          symbol = "";
          style = "bg:#5D6D9E";
          format = "[[ $symbol ($version) ](fg:#394260 bg:##5D6D9E)]($style)";
          };

          golang = {
          symbol = "";
          style = "bg:#5D6D9E";
          format = "[[ $symbol ($version) ](fg:#394260 bg:##5D6D9E)]($style)";
          };
          
          php = {
          symbol = "";
          style = "bg:#5D6D9E";
          format = "[[ $symbol ($version) ](fg:#394260 bg:##5D6D9E)]($style)";
          };
          
          time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#4A567D";
          format = "[[  $time ](fg:#a0a9cb bg:#4A567D)]($style)";
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
