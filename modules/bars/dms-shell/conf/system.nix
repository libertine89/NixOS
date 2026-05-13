{
  notificationOverlayEnabled = false;
  notificationPopupShadowEnabled = true;
  notificationPopupPrivacyMode = false;
  modalDarkenBackground = true;
  lockScreenShowPowerActions = true;
  lockScreenShowSystemIcons = true;
  lockScreenShowTime = true;
  lockScreenShowDate = true;
  lockScreenShowProfileImage = true;
  lockScreenShowPasswordField = true;
  lockScreenShowMediaPlayer = true;
  lockScreenPowerOffMonitorsOnLock = false;
  lockAtStartup = false;
  enableFprint = false;
  maxFprintTries = 15;
  enableU2f = false;
  u2fMode = "or";
  lockScreenActiveMonitor = "all";
  lockScreenInactiveColor = "#000000";
  lockScreenNotificationMode = 0;
  hideBrightnessSlider = false;

  notificationTimeoutLow = 5000;
  notificationTimeoutNormal = 5000;
  notificationTimeoutCritical = 0;
  notificationCompactMode = false;
  notificationPopupPosition = 0;
  notificationAnimationSpeed = 1;
  notificationCustomAnimationDuration = 400;
  notificationHistoryEnabled = true;
  notificationHistoryMaxCount = 50;
  notificationHistoryMaxAgeDays = 7;
  notificationHistorySaveLow = true;
  notificationHistorySaveNormal = true;
  notificationHistorySaveCritical = true;
  notificationRules = [];

  osdAlwaysShowValue = false;
  osdPosition = 5;
  osdVolumeEnabled = true;
  osdMediaVolumeEnabled = true;
  osdMediaPlaybackEnabled = false;
  osdBrightnessEnabled = true;
  osdIdleInhibitorEnabled = true;
  osdMicMuteEnabled = true;
  osdCapsLockEnabled = true;
  osdPowerProfileEnabled = true;
  osdAudioOutputEnabled = true;

  powerActionConfirm = true;
  powerActionHoldDuration = 0.5;
  powerMenuActions = [ "reboot" "logout" "poweroff" "lock" "suspend" "restart" ];
  powerMenuDefaultAction = "logout";
  powerMenuGridLayout = false;
  customPowerActionLock = "";
  customPowerActionLogout = "";
  customPowerActionSuspend = "";
  customPowerActionHibernate = "";
  customPowerActionReboot = "";
  customPowerActionPowerOff = "";

  updaterHideWidget = false;
  updaterUseCustomCommand = false;
  updaterCustomCommand = "";
  updaterTerminalAdditionalParams = "";

  displayNameMode = "system";
  screenPreferences = { wallpaper = [ "all" ]; };
  showOnLastDisplay = {};
  niriOutputSettings = {};
  hyprlandOutputSettings = {};
  displayProfiles = {};
  activeDisplayProfile = {};
  displayProfileAutoSelect = false;
  displayShowDisconnected = false;
  displaySnapToEdge = true;

  barConfigs = [
    {
      id = "default";
      name = "Main Bar";
      enabled = true;
      position = 0;
      screenPreferences = [ "all" ];
      showOnLastDisplay = true;
      leftWidgets = [ "launcherButton" "workspaceSwitcher" ];
      centerWidgets = [
        "music"
        { id = "focusedWindow"; enabled = true; }
      ];
      rightWidgets = [
        { id = "cpuUsage"; enabled = true; }
        { id = "memUsage"; enabled = true; }
        { id = "battery"; enabled = true; }
        { id = "controlCenterButton"; enabled = true; }
        { id = "clipboard"; enabled = true; }
        { id = "clock"; enabled = true; }
        { id = "notificationButton"; enabled = true; }
        { id = "powerMenuButton"; enabled = true; }
      ];
      spacing = 4;
      innerPadding = 4;
      bottomGap = 0;
      transparency = 0;
      widgetTransparency = 1;
      squareCorners = false;
      noBackground = false;
      maximizeWidgetIcons = false;
      maximizeWidgetText = false;
      removeWidgetPadding = false;
      widgetPadding = 8;
      gothCornersEnabled = false;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      borderEnabled = false;
      borderColor = "surfaceText";
      borderOpacity = 1;
      borderThickness = 1;
      widgetOutlineEnabled = false;
      widgetOutlineColor = "primary";
      widgetOutlineOpacity = 1;
      widgetOutlineThickness = 1;
      fontScale = 1;
      iconScale = 1;
      autoHide = false;
      autoHideDelay = 250;
      showOnWindowsOpen = false;
      openOnOverview = false;
      visible = true;
      popupGapsAuto = true;
      popupGapsManual = 4;
      maximizeDetection = true;
      scrollEnabled = true;
      scrollXBehavior = "column";
      scrollYBehavior = "workspace";
      shadowIntensity = 100;
      shadowOpacity = 64;
      shadowColorMode = "custom";
      shadowCustomColor = "#000000";
      clickThrough = false;
    }
  ];

  systemMonitorEnabled = false;
  systemMonitorShowHeader = true;
  systemMonitorTransparency = 0.8;
  systemMonitorColorMode = "primary";
  systemMonitorCustomColor = {
    r = 1; g = 1; b = 1; a = 1;
    hsvHue = -1; hsvSaturation = 0; hsvValue = 1;
    hslHue = -1; hslSaturation = 0; hslLightness = 1;
    valid = true;
  };
  systemMonitorShowCpu = true;
  systemMonitorShowCpuGraph = true;
  systemMonitorShowCpuTemp = true;
  systemMonitorShowGpuTemp = false;
  systemMonitorGpuPciId = "";
  systemMonitorShowMemory = true;
  systemMonitorShowMemoryGraph = true;
  systemMonitorShowNetwork = true;
  systemMonitorShowNetworkGraph = true;
  systemMonitorShowDisk = true;
  systemMonitorShowTopProcesses = false;
  systemMonitorTopProcessCount = 3;
  systemMonitorTopProcessSortBy = "cpu";
  systemMonitorGraphInterval = 60;
  systemMonitorLayoutMode = "auto";
  systemMonitorX = -1;
  systemMonitorY = -1;
  systemMonitorWidth = 320;
  systemMonitorHeight = 480;
  systemMonitorDisplayPreferences = [ "all" ];
  systemMonitorVariants = [];

  desktopWidgetPositions = {};
  desktopWidgetGridSettings = {};
  desktopWidgetInstances = [];
  desktopWidgetGroups = [];

  builtInPluginSettings = {
    dms_settings_search = { trigger = "?"; };
  };

  clipboardEnterToPaste = false;
  launcherPluginVisibility = {};
  launcherPluginOrder = [];

  configVersion = 5;
}
