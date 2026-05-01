{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.starship = {
        enable = true;
        settings = {
          format = "[░▒▓](#0A0373)[ 󱄅 ](bg:#0A0373 fg:#E6E6FF)[](fg:#0A0373 bg:#1C1690)[](fg:#1C1690 bg:#3A36B5)$directory[](fg:#3A36B5)$fill[](fg:#2A2680 bg:#2A2680)$git_branch$git_status[](fg:#1C1970 bg:#1C1970)$nodejs$bun$rust$golang$php[](fg:#020152 bg:#020152)$time[▓▒░](fg:#020152)\n$character";

          fill = {
            symbol = " ";
          };

          directory = {
            style = "fg:#E6E6FF bg:#3A36B5";
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
            style = "bg:#2A2680";
            format = "[[ $symbol $branch ](fg:#AFAFFF bg:#2A2680)]($style)";
          };

          git_status = {
            style = "bg:#2A2680";
            format = "[[($all_status$ahead_behind )](fg:#AFAFFF bg:#2A2680)]($style)";
          };

          nodejs = {
            symbol = "";
            style = "bg:#1C1970";
            format = "[[ $symbol ($version) ](fg:#9FA8FF bg:#1C1970)]($style)";
          };

          bun = {
            symbol = "";
            style = "bg:#1C1970";
            format = "[[ $symbol ($version) ](fg:#9FA8FF bg:#1C1970)]($style)";
          };

          rust = {
            symbol = "";
            style = "bg:#1C1970";
            format = "[[ $symbol ($version) ](fg:#9FA8FF bg:#1C1970)]($style)";
          };

          golang = {
            symbol = "";
            style = "bg:#1C1970";
            format = "[[ $symbol ($version) ](fg:#9FA8FF bg:#1C1970)]($style)";
          };

          php = {
            symbol = "";
            style = "bg:#1C1970";
            format = "[[ $symbol ($version) ](fg:#9FA8FF bg:#1C1970)]($style)";
          };

          time = {
            disabled = false;
            time_format = "%R";
            style = "bg:#020152";
            format = "[[  $time ](fg:#E6E6FF bg:#020152)]($style)";
          };

          character = {
            success_symbol = "[❯](#E6E6FF)";
            error_symbol = "[❯](#FF5C57)";
            vimcmd_symbol = "[❮](#6905F7)";
          };

          cmd_duration = {
            format = "[$duration]($style) ";
            style = "yellow";
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
        };
      };
    })
  ];
}
