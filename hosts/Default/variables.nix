{
  username = "nixius"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "hyprland"; # hyprland, ,niri, i3, gnome, plasma6

  # Theme & Appearance
  bar = "noctalia-shell"; # waybar, hyprpanel, noctalia-shell, caelestia-shell
  waybarTheme = "minimal"; # stylish, minimal
  windowTheme = "Catppuccin"; #Catppuccin, Dracula, rose-pine
  sddmTheme = "black_hole"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "escape_velocity.webp"; # Change with SUPER + SHIFT + W (Hyprland)
  hyprlockWallpaper = "escape_velocity.webp"; 

  # Default Applications
  terminal = "kitty"; # kitty, alacritty
  editor = "nvchad"; # nixvim, vscode, helix, doom-emacs, nvchad, neovim
  ide = "code-cursor"; # vscode, code-cursor
  browser = "firefox"; # zen-beta, firefox, floorp
  fileManager = "yazi"; # yazi, lf, thunar
  shell = "zsh"; # zsh, bash
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
