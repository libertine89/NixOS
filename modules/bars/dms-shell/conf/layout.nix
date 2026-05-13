{
  showWorkspaceIndex = false;
  showWorkspaceName = false;
  showWorkspacePadding = false;
  workspaceScrolling = false;
  showWorkspaceApps = false;
  workspaceDragReorder = true;
  maxWorkspaceIcons = 3;
  workspaceAppIconSizeOffset = 0;
  groupWorkspaceApps = true;
  workspaceFollowFocus = false;
  showOccupiedWorkspacesOnly = false;
  reverseScrolling = false;
  dwlShowAllTags = false;
  workspaceColorMode = "default";
  workspaceOccupiedColorMode = "none";
  workspaceUnfocusedColorMode = "default";
  workspaceUrgentColorMode = "default";
  workspaceFocusedBorderEnabled = false;
  workspaceFocusedBorderColor = "primary";
  workspaceFocusedBorderThickness = 2;
  workspaceNameIcons = {};
  waveProgressEnabled = true;
  scrollTitleEnabled = true;
  audioVisualizerEnabled = true;
  audioScrollMode = "volume";
  audioWheelScrollAmount = 5;
  clockCompactMode = false;
  focusedWindowCompactMode = false;
  runningAppsCompactMode = true;
  barMaxVisibleApps = 0;
  barMaxVisibleRunningApps = 0;
  barShowOverflowBadge = true;
  appsDockHideIndicators = false;
  appsDockColorizeActive = false;
  appsDockActiveColorMode = "primary";
  appsDockEnlargeOnHover = false;
  appsDockEnlargePercentage = 125;
  appsDockIconSizePercentage = 100;
  keyboardLayoutNameCompactMode = false;
  runningAppsCurrentWorkspace = true;
  runningAppsGroupByApp = false;
  runningAppsCurrentMonitor = false;
  appIdSubstitutions = [];
  centeringMode = "index";
  showDock = false;
  dockAutoHide = false;
  dockSmartAutoHide = false;
  dockGroupByApp = false;
  dockOpenOnOverview = false;
  dockPosition = 1;
  dockSpacing = 4;
  dockBottomGap = 0;
  dockMargin = 0;
  dockIconSize = 40;
  dockIndicatorStyle = "circle";
  dockBorderEnabled = false;
  dockBorderColor = "surfaceText";
  dockBorderOpacity = 1;
  dockBorderThickness = 1;
  dockIsolateDisplays = false;
  dockLauncherEnabled = false;
  dockLauncherLogoMode = "apps";
  dockLauncherLogoCustomPath = "";
  dockLauncherLogoColorOverride = "";
  dockLauncherLogoSizeOffset = 0;
  dockLauncherLogoBrightness = 0.5;
  dockLauncherLogoContrast = 1;
  dockMaxVisibleApps = 0;
  dockMaxVisibleRunningApps = 0;
  dockShowOverflowBadge = true;

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
}
