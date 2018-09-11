{ config, pkgs, ... }:

{
  imports = 
    [
      ./core.nix
      ./desktop-hardware-configuration.nix
      ./dev-services.nix
    ];
  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sdb";
    extraEntries = ''
      menuentry "Windows 10" {
        insmod ntfs
        set root=(hd1,1)
        chainloader +1
      }
    '';
  };

  # Jack stuff
  boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];

  networking = {
    hostName = "desktop-nix";
    firewall.allowedTCPPorts = [ 8000 ];
  };

  services.xserver= {
    videoDrivers = ["nvidia"];
    windowManager.i3 = {
      enable = true;
      configFile = /home/minoulefou/.config/i3/config;
    };
  };

  services.syncthing = {
    user = "minoulefou";
    dataDir = "/home/minoulefou/.config/syncthing";
  };

  users.extraUsers.minoulefou = {
      isNormalUser = true;
      home = "/home/minoulefou";
      extraGroups = [ "wheel" "audio" "video" "storage" "optical" "wireshark" ];
      shell = pkgs.zsh;
  };

  services.mysql = {
      package = pkgs.mariadb;
      enable = true;
  };

  system.stateVersion = "18.09"; # Did you read the comment?
  nix.useSandbox = true;
}
