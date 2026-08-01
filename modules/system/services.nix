{ ... }:
{
  # Services to start
  services = {
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    devmon.enable = true; # For Mounting USB & More
    gvfs.enable = true; # For Mounting USB & More
    udisks2.enable = true; # For Mounting USB & More

    # Userspace CPU Scheduler for Improved Latency for Gaming (Hardware Specific)
    # services.scx = {
    #   enable = true;
    #   package = pkgs.scx.rustscheds;
    #   scheduler = "scx_lavd"; # https://github.com/sched-ext/scx/blob/main/scheds/rust/README.md
    # };

    # kanata = {
    #   enable = true;
    #   keyboards = {
    #     internalKeyboard = {
    #       devices = [
    #         "/dev/input/by-id/usb-Logitech_USB_Receiver-if01-event-kbd"
    #       ];
    #       extraDefCfg = "process-unmapped-keys yes";
    #       config = ''
    #         (defsrc
    #         Space a s d f j k l ;
    #         )
    #         (defvar
    #         tap-time 150
    #         hold-time 200
    #         )
    #         (defalias
    #         Space (tap-hold $tap-time $hold-time Space F8)
    #         a (tap-hold $tap-time $hold-time a lmet)
    #         s (tap-hold $tap-time $hold-time s lalt)
    #         d (tap-hold $tap-time $hold-time d lsft)
    #         f (tap-hold $tap-time $hold-time f lctl)
    #         j (tap-hold $tap-time $hold-time j rctl)
    #         k (tap-hold $tap-time $hold-time k rsft)
    #         l (tap-hold $tap-time $hold-time l ralt)
    #         ; (tap-hold $tap-time $hold-time ; rmet)
    #         )

    #         (deflayer base
    #         @Space @a  @s  @d  @f  @j  @k  @l  @;
    #         )
    #       '';
    #     };
    #   };
    # };

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        KbdInteractiveAuthentication = true;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
      };
    };
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      # wireplumber = {
      #   enable = true;
      #   configPackages = [
      #     (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf" ''
      #       bluetooth.autoswitch-to-headset-profile = false
      #     '')
      #   ];
      # };
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 256;
        };
      };
      extraConfig.pipewire-pulse."92-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse.min.req = "256/48000";
              pulse.default.req = "256/48000";
              pulse.max.req = "256/48000";
              pulse.min.quantum = "256/48000";
              pulse.max.quantum = "256/48000";
            };
          }
        ];
      };
    };
  };
}
