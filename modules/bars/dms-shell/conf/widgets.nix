{
  clockDateFormat = "ddd MMM d";
  lockDateFormat = "";
  desktopClockEnabled = false;
  desktopClockStyle = "analog";
  desktopClockTransparency = 0.8;
  desktopClockColorMode = "primary";
  desktopClockCustomColor = {
    r = 1;
    g = 1;
    b = 1;
    a = 1;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    hslHue = -1;
    hslSaturation = 0;
    hslLightness = 1;
    valid = true;
  };
  desktopClockShowDate = true;
  desktopClockShowAnalogNumbers = false;
  desktopClockShowAnalogSeconds = true;
  desktopClockX = -1;
  desktopClockY = -1;
  desktopClockWidth = 280;
  desktopClockHeight = 180;
  desktopClockDisplayPreferences = [ "all" ];

  greeterRememberLastSession = true;
  greeterRememberLastUser = true;
  greeterEnableFprint = false;
  greeterEnableU2f = false;
  greeterWallpaperPath = "";

  notepadUseMonospace = true;
  notepadFontFamily = "";
  notepadFontSize = 14;
  notepadShowLineNumbers = false;
  notepadTransparencyOverride = -1;
  notepadLastCustomTransparency = 0.7;

  soundsEnabled = true;
  useSystemSoundTheme = false;
  soundNewNotification = true;
  soundVolumeChanged = true;
  soundPluggedIn = true;

  acMonitorTimeout = 0;
  acLockTimeout = 0;
  acSuspendTimeout = 0;
  acSuspendBehavior = 0;
  acProfileName = "";
  batteryMonitorTimeout = 0;
  batteryLockTimeout = 0;
  batterySuspendTimeout = 0;
  batterySuspendBehavior = 0;
  batteryProfileName = "";
  batteryChargeLimit = 100;
  lockBeforeSuspend = false;
  loginctlLockIntegration = true;
  fadeToLockEnabled = true;
  fadeToLockGracePeriod = 5;
  fadeToDpmsEnabled = true;
  fadeToDpmsGracePeriod = 5;

  launchPrefix = "";
  brightnessDevicePins = {};
  wifiNetworkPins = {};
  bluetoothDevicePins = {};
  audioInputDevicePins = {};
  audioOutputDevicePins = {};

  gtkThemingEnabled = false;
  qtThemingEnabled = false;
  syncModeWithPortal = true;
  terminalsAlwaysDark = false;

  muxType = "tmux";
  muxUseCustomCommand = false;
  muxCustomCommand = "";
  muxSessionFilter = "";

  runDmsMatugenTemplates = true;
  matugenTemplateGtk = true;
  matugenTemplateNiri = true;
  matugenTemplateHyprland = true;
  matugenTemplateMangowc = true;
  matugenTemplateQt5ct = true;
  matugenTemplateQt6ct = true;
  matugenTemplateFirefox = true;
  matugenTemplatePywalfox = true;
  matugenTemplateZenBrowser = true;
  matugenTemplateVesktop = true;
  matugenTemplateEquibop = true;
  matugenTemplateGhostty = true;
  matugenTemplateKitty = true;
  matugenTemplateFoot = true;
  matugenTemplateAlacritty = true;
  matugenTemplateNeovim = false;
  matugenTemplateWezterm = true;
  matugenTemplateDgop = true;
  matugenTemplateKcolorscheme = true;
  matugenTemplateVscode = true;
  matugenTemplateEmacs = true;
  matugenTemplateZed = true;

  cursorSettings = {
    theme = "System Default";
    size = 24;
    niri = {
      hideWhenTyping = false;
      hideAfterInactiveMs = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    dwl = {
      cursorHideTimeout = 0;
    };
  };
}
