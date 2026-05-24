{
  username = "nixius"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "niri"; # hyprland, niri, i3, gnome, plasma6

  # Theme & Appearance
  bar = "dms-shell"; # waybar, hyprpanel, noctalia-shell, caelestia-shell, dms-shell
  waybarTheme = "minimal"; # stylish, minimal
  windowTheme = "Catppuccin"; #Catppuccin, Dracula, rose-pine
  sddmTheme = "black_hole"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  plymouthTheme = "motion"; # angular_alt, blockchain, connect, cubes, dark_planet, deus_ex, dna
                            # flame, glowing, green_blocks, hexagon_dots_alt, hud_2, motion, square
  defaultWallpaper = "abstract101.png"; # Change with SUPER + SHIFT + W (Hyprland)
  hyprlockWallpaper = "abstract101.png";

  # Default Applications
  terminal = "kitty"; # kitty, alacritty
  editor = "nvchad"; # nixvim, vscode, helix, doom-emacs, nvchad, neovim
  ide = "code-cursor"; # vscode, code-cursor
  browser = "firefox"; # zen-beta, firefox, floorp
  fileManager = "yazi"; # yazi, lf, thunar
  shell = "zsh"; # zsh, bash
  shellPrompt = "starship"; # oh-my-posh, starship
  games = true; # Enable/Disable gaming module

  # Hardware
  hostname = "Nixius";
  videoDriver = "nvidia"; # nvidia, amdgpu, intel
  nvidiaChannel = "legacy_580"; # stable, latest, beta, legacy_xxx
  bluetoothSupport = false; # Whether your motherboard supports bluetooth

  # Localization
  timezone = "Europe/London";
  locale = "en_GB.UTF-8";
  clock24h = true;
  kbdLayout = "gb";
  kbdVariant = "extd";
  consoleKeymap = "uk";
}
