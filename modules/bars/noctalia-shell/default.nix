{ inputs, host, pkgs, ... }:

let
  inherit (import ../../../hosts/${host}/variables.nix) clock24h bluetoothSupport;

  noctaliaOnWallpaperChanged = pkgs.callPackage ../../desktop/scripts/niriscripts/noctaliaOnWallpaperChanged.nix {};
in
{
  # Optional Dependencies
  environment.systemPackages = with pkgs; [
    wl-clipboard
    brightnessctl
    xwayland
    # wf-recorder
  ];

  home-manager.sharedModules = [
    ( { config, ... }: {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia-shell = {
        enable = true;
        systemd.enable = false;

        settings = {
          settingsVersion = 59;

          bar = {
            barType = "simple";
            position = "top";
            monitors = [];
            density = "compact";
            showOutline = false;
            showCapsule = false;
            capsuleOpacity = 1;
            capsuleColorKey = "none";
            widgetSpacing = 1;
            contentPadding = 2;
            fontScale = 1;
            enableExclusionZoneInset = false;
            backgroundOpacity = 1;
            useSeparateOpacity = true;
            marginVertical = 8;
            marginHorizontal = 10;
            frameThickness = 8;
            frameRadius = 12;
            outerCorners = true;
            hideOnOverview = false;
            displayMode = "always_visible";
            autoHideDelay = 500;
            autoShowDelay = 150;
            showOnWorkspaceSwitch = true;

            widgets = {
              left = [
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "secondary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  fontWeight = "bold";
                  groupedBorderOpacity = 1;
                  hideUnoccupied = false;
                  iconScale = 0.8;
                  id = "Workspace";
                  labelMode = "none";
                  occupiedColor = "secondary";
                  pillSize = 0.6;
                  showApplications = false;
                  showApplicationsHover = false;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = false;
                  unfocusedIconsOpacity = 1;
                }
                {
                  colorName = "primary";
                  hideWhenIdle = false;
                  id = "AudioVisualizer";
                  width = 100;
                }
              ];

              center = [
                {
                  colorizeIcons = false;
                  hideMode = "hidden";
                  id = "ActiveWindow";
                  maxWidth = 145;
                  scrollingMode = "hover";
                  showIcon = true;
                  showText = true;
                  textColor = "none";
                  useFixedWidth = false;
                }
              ];

              right = [
                {
                  blacklist = [ "nm-applet" ];
                  chevronColor = "none";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  compactMode = false;
                  diskPath = "/";
                  iconColor = "primary";
                  id = "SystemMonitor";
                  showCpuCores = false;
                  showCpuFreq = false;
                  showCpuTemp = true;
                  showCpuUsage = true;
                  showDiskAvailable = false;
                  showDiskUsage = false;
                  showDiskUsageAsPercent = false;
                  showGpuTemp = false;
                  showLoadAverage = false;
                  showMemoryAsPercent = false;
                  showMemoryUsage = true;
                  showNetworkStats = false;
                  showSwapUsage = false;
                  textColor = "none";
                  useMonospaceFont = true;
                  usePadding = false;
                }
                {
                  clockColor = "none";
                  customFont = "";
                  formatHorizontal = "ddd, dd MMM HH:mm";
                  formatVertical = "HH mm";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  iconColor = "none";
                  id = "KeepAwake";
                  textColor = "none";
                }
                {
                  iconColor = "error";
                  id = "SessionMenu";
                }
              ];
            };

            mouseWheelAction = "none";
            reverseScroll = false;
            mouseWheelWrap = true;
            middleClickAction = "none";
            middleClickFollowMouse = false;
            middleClickCommand = "";
            rightClickAction = "controlCenter";
            rightClickFollowMouse = true;
            rightClickCommand = "";
            screenOverrides = [];
          };
          general = {
            avatarImage = "${config.home.homeDirectory}/NixOS/modules/bars/noctalia-shell/profile-picture.jpg";
            dimmerOpacity = 0.2;
            showScreenCorners = false;
            forceBlackScreenCorners = false;
            scaleRatio = 0.8500000000000001;
            radiusRatio = 0.2;
            iRadiusRatio = 1;
            boxRadiusRatio = 1;
            screenRadiusRatio = 1;
            animationSpeed = 1;
            animationDisabled = false;
            compactLockScreen = false;
            lockScreenAnimations = false;
            lockOnSuspend = true;
            showSessionButtonsOnLockScreen = true;
            showHibernateOnLockScreen = false;
            enableLockScreenMediaControls = false;
            enableShadows = true;
            enableBlurBehind = true;
            shadowDirection = "bottom_right";
            shadowOffsetX = 2;
            shadowOffsetY = 3;
            language = "";
            allowPanelsOnScreenWithoutBar = true;
            showChangelogOnStartup = false;
            telemetryEnabled = false;
            enableLockScreenCountdown = true;
            lockScreenCountdownDuration = 10000;
            autoStartAuth = false;
            allowPasswordWithFprintd = false;
            clockStyle = "custom";
            clockFormat = "hh\\nmm";
            passwordChars = false;
            lockScreenMonitors = [];
            lockScreenBlur = 0.3;
            lockScreenTint = 0.2;

            keybinds = {
              keyUp = [ "Up" ];
              keyDown = [ "Down" ];
              keyLeft = [ "Left" ];
              keyRight = [ "Right" ];
              keyEnter = [ "Return" "Enter" ];
              keyEscape = [ "Esc" ];
              keyRemove = [ "Del" ];
            };

            reverseScroll = false;
            smoothScrollEnabled = true;
          };

          ui = {
            fontDefault = "JetBrainsMonoNL NFP ExtraBold";
            fontFixed = "JetBrainsMono Nerd Font Mono";
            fontDefaultScale = 0.84;
            fontFixedScale = 0.84;
            tooltipsEnabled = true;
            scrollbarAlwaysVisible = true;
            boxBorderEnabled = false;
            panelBackgroundOpacity = 0.93;
            translucentWidgets = false;
            panelsAttachedToBar = true;
            settingsPanelMode = "attached";
            settingsPanelSideBarCardStyle = false;
          };

          location = {
            name = "London, United Kingdom";
            weatherEnabled = true;
            weatherShowEffects = true;
            weatherTaliaMascotAlways = false;
            useFahrenheit = false;
            use12hourFormat = false;
            showWeekNumberInCalendar = true;
            showCalendarEvents = true;
            showCalendarWeather = true;
            analogClockInCalendar = false;
            firstDayOfWeek = -1;
            hideWeatherTimezone = false;
            hideWeatherCityName = false;
            autoLocate = false;
          };

          calendar = {
            cards = [
              {
                enabled = true;
                id = "calendar-header-card";
              }
              {
                enabled = true;
                id = "calendar-month-card";
              }
              {
                enabled = true;
                id = "weather-card";
              }
            ];
          };

          wallpaper = {
            enabled = true;
            overviewEnabled = true;
            directory = "${config.home.homeDirectory}/NixOS/modules/themes/wallpapers";
            monitorDirectories = [];
            enableMultiMonitorDirectories = false;
            showHiddenFiles = false;
            viewMode = "single";
            setWallpaperOnAllMonitors = true;
            linkLightAndDarkWallpapers = true;
            fillMode = "crop";
            fillColor = "#000000";
            useSolidColor = false;
            solidColor = "#1a1a2e";
            automationEnabled = false;
            wallpaperChangeMode = "random";
            randomIntervalSec = 300;
            transitionDuration = 1500;
            transitionType = [ "fade" "disc" "stripes" "wipe" "pixelate" "honeycomb" ];
            skipStartupTransition = false;
            transitionEdgeSmoothness = 0.05;
            panelPosition = "follow_bar";
            hideWallpaperFilenames = false;
            useOriginalImages = false;
            overviewBlur = 0.4;
            overviewTint = 0.6;
            useWallhaven = false;
            wallhavenQuery = "";
            wallhavenSorting = "relevance";
            wallhavenOrder = "desc";
            wallhavenCategories = "111";
            wallhavenPurity = "100";
            wallhavenRatios = "";
            wallhavenApiKey = "";
            wallhavenResolutionMode = "atleast";
            wallhavenResolutionWidth = "";
            wallhavenResolutionHeight = "";
            sortOrder = "name";
            favorites = [];
          };

          appLauncher = {
            enableClipboardHistory = true;
            autoPasteClipboard = false;
            enableClipPreview = true;
            clipboardWrapText = true;
            enableClipboardSmartIcons = true;
            enableClipboardChips = true;
            clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
            clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
            position = "center";
            pinnedApps = [];
            sortByMostUsed = true;
            terminalCommand = "alacritty -e";
            customLaunchPrefixEnabled = false;
            customLaunchPrefix = "";
            viewMode = "list";
            showCategories = true;
            iconMode = "tabler";
            showIconBackground = false;
            enableSettingsSearch = false;
            enableWindowsSearch = false;
            enableSessionSearch = false;
            ignoreMouseInput = false;
            screenshotAnnotationTool = "";
            overviewLayer = false;
            density = "default";
          };
          controlCenter = {
            position = "close_to_bar_button";
            diskPath = "/";

            shortcuts = {
              left = [
                { id = "Network"; }
                { id = "Bluetooth"; }
                { id = "AirplaneMode"; }
                { id = "WallpaperSelector"; }
                { id = "NoctaliaPerformance"; }
              ];

              right = [
                { id = "Notifications"; }
                { id = "KeepAwake"; }
                { id = "DarkMode"; }
                { id = "NightLight"; }
              ];
            };

            cards = [
              { enabled = true; id = "profile-card"; }
              { enabled = true; id = "shortcuts-card"; }
              { enabled = true; id = "audio-card"; }
              { enabled = true; id = "brightness-card"; }
              { enabled = true; id = "weather-card"; }
              { enabled = true; id = "media-sysmon-card"; }
            ];
          };

          systemMonitor = {
            cpuWarningThreshold = 80;
            cpuCriticalThreshold = 90;
            tempWarningThreshold = 80;
            tempCriticalThreshold = 90;
            gpuWarningThreshold = 80;
            gpuCriticalThreshold = 90;
            memWarningThreshold = 80;
            memCriticalThreshold = 90;
            swapWarningThreshold = 80;
            swapCriticalThreshold = 90;
            diskWarningThreshold = 80;
            diskCriticalThreshold = 90;
            diskAvailWarningThreshold = 20;
            diskAvailCriticalThreshold = 10;
            batteryWarningThreshold = 20;
            batteryCriticalThreshold = 5;
            enableDgpuMonitoring = false;
            useCustomColors = false;
            warningColor = "";
            criticalColor = "";

            externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
          };

          noctaliaPerformance = {
            disableWallpaper = true;
            disableDesktopWidgets = true;
          };

          dock = {
            enabled = false;
            position = "bottom";
            displayMode = "auto_hide";
            dockType = "floating";
            backgroundOpacity = 1;
            floatingRatio = 1;
            size = 1;
            onlySameOutput = true;
            monitors = [];
            pinnedApps = [];
            colorizeIcons = false;
            showLauncherIcon = false;
            launcherPosition = "end";
            launcherUseDistroLogo = false;
            launcherIcon = "";
            launcherIconColor = "none";
            pinnedStatic = false;
            inactiveIndicators = false;
            groupApps = false;
            groupContextMenuMode = "extended";
            groupClickAction = "cycle";
            groupIndicatorStyle = "dots";
            deadOpacity = 0.6;
            animationSpeed = 1;
            sitOnFrame = false;
            showDockIndicator = false;
            indicatorThickness = 3;
            indicatorColor = "primary";
            indicatorOpacity = 0.6;
          };

          network = {
            bluetoothRssiPollingEnabled = false;
            bluetoothRssiPollIntervalMs = 60000;
            networkPanelView = "wifi";
            wifiDetailsViewMode = "grid";
            bluetoothDetailsViewMode = "grid";
            bluetoothHideUnnamedDevices = false;
            disableDiscoverability = false;
            bluetoothAutoConnect = true;
          };

          sessionMenu = {
            enableCountdown = true;
            countdownDuration = 5000;
            position = "center";
            showHeader = true;
            showKeybinds = true;
            largeButtonsStyle = true;
            largeButtonsLayout = "single-row";

            powerOptions = [
              {
                action = "lock";
                command = "loginctl lock-session";
                countdownEnabled = false;
                enabled = true;
                keybind = "1";
              }
              {
                action = "suspend";
                command = "";
                countdownEnabled = false;
                enabled = true;
                keybind = "2";
              }
              {
                action = "hibernate";
                command = "";
                countdownEnabled = false;
                enabled = false;
                keybind = "";
              }
              {
                action = "reboot";
                command = "";
                countdownEnabled = false;
                enabled = true;
                keybind = "3";
              }
              {
                action = "logout";
                command = "";
                countdownEnabled = false;
                enabled = true;
                keybind = "4";
              }
              {
                action = "shutdown";
                command = "";
                countdownEnabled = false;
                enabled = true;
                keybind = "5";
              }
              {
                action = "rebootToUefi";
                command = "";
                countdownEnabled = false;
                enabled = false;
                keybind = "";
              }
              {
                action = "userspaceReboot";
                command = "";
                countdownEnabled = true;
                enabled = false;
                keybind = "";
              }
            ];
          };

          notifications = {
            enabled = false;
            enableMarkdown = false;
            density = "default";
            monitors = [];
            location = "top_right";
            overlayLayer = true;
            backgroundOpacity = 1;
            respectExpireTimeout = false;

            lowUrgencyDuration = 3;
            normalUrgencyDuration = 8;
            criticalUrgencyDuration = 15;

            clearDismissed = true;

            saveToHistory = {
              low = true;
              normal = true;
              critical = true;
            };

            sounds = {
              enabled = false;
              volume = 0.5;
              separateSounds = false;
              criticalSoundFile = "";
              normalSoundFile = "";
              lowSoundFile = "";
              excludedApps = "discord,firefox,chrome,chromium,edge";
            };

            enableMediaToast = false;
            enableKeyboardLayoutToast = true;
            enableBatteryToast = true;
          };

          osd = {
            enabled = true;
            location = "top_right";
            autoHideMs = 2000;
            overlayLayer = true;
            backgroundOpacity = 1;
            enabledTypes = [ 0 1 2 ];
            monitors = [];
          };

          audio = {
            volumeStep = 5;
            volumeOverdrive = false;
            spectrumFrameRate = 30;
            visualizerType = "linear";
            spectrumMirrored = true;
            mprisBlacklist = [];
            preferredPlayer = "";
            volumeFeedback = false;
            volumeFeedbackSoundFile = "";
          };

          brightness = {
            brightnessStep = 1;
            enforceMinimum = true;
            enableDdcSupport = true;
            backlightDeviceMappings = [];
          };

          colorSchemes = {
            useWallpaperColors = true;
            predefinedScheme = "Catppuccin";
            darkMode = true;
            schedulingMode = "off";
            manualSunrise = "06:30";
            manualSunset = "18:30";
            generationMethod = "faithful";
            monitorForColors = "";
            syncGsettings = true;
          };

          templates = {
            activeTemplates = [];
            enableUserTheming = false;
          };

          nightLight = {
            enabled = true;
            forced = true;
            autoSchedule = true;
            nightTemp = "4000";
            dayTemp = "6500";
            manualSunrise = "06:30";
            manualSunset = "18:30";
          };

          hooks = {
            enabled = true;
            wallpaperChange = "";
            darkModeChange = "";
            screenLock = "";
            screenUnlock = "";
            performanceModeEnabled = "";
            performanceModeDisabled = "";
            startup = "";
            session = "";
            colorGeneration = "${noctaliaOnWallpaperChanged}";
          };

          plugins = {
            autoUpdate = false;
            notifyUpdates = true;
          };

          idle = {
            enabled = true;
            screenOffTimeout = 600;
            lockTimeout = 660;
            suspendTimeout = 1800;
            fadeDuration = 5;
            screenOffCommand = "";
            lockCommand = "";
            suspendCommand = "";
            resumeScreenOffCommand = "";
            resumeLockCommand = "";
            resumeSuspendCommand = "";
            customCommands = "[]";
          };

          desktopWidgets = {
            enabled = false;
            overviewEnabled = true;
            gridSnap = false;
            gridSnapScale = false;
            monitorWidgets = [];
          };
        };
      };
    })
  ];
}
