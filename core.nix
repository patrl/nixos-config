{ config, pkgs, ... }:

let 
  keys = import ./keys.nix;
  extra-pkgs = import ./extra-pkgs/default.nix;
in rec {
  imports =
    [ 
      ./packages.nix
      ./software-configuration.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Extra packages overlay

  nixpkgs.overlays = [ extra-pkgs ];
  networking.firewall.allowedTCPPorts = [ 
    # Syncthing
    22000 
  ];

  networking.firewall.allowedUDPPorts = [ 
    # Syncthing
    21027
  ];

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull.override { jackaudioSupport = true; };
  };

  i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "fr-bepo";
     defaultLocale = "fr_FR.UTF-8";
  };

  time.timeZone = "Europe/Paris";

  programs.zsh = {
    enable = true;
    ohMyZsh = { 
      enable = true;
      theme = "af-magic";
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  services.syncthing.enable = true;

  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "bepo";
    displayManager.sessionCommands = ''
        xset b off
        setxkbmap -option "caps:swapescape"
        udiskie -Ns &
    '';
  };
}
