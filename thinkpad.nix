{ config, pkgs, ... }:

{
  imports =
    [ 
      ./core.nix
      ./thinkpad-hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    enableCryptodisk = true;
    version = 2;
    device = "/dev/sda";
  };

  networking = {
    hostName = "thinkpad-nix";
    firewall.allowedTCPPorts = [ 8000 ];
    networkmanager.enable = true;
  };

  users.extraUsers.ninjatrappeur= {
      isNormalUser = true;
      home = "/home/ninjatrappeur";
      extraGroups = [ "networkmanager" "wheel" "audio" "video" "storage" "optical" "wireshark" ];
      shell = pkgs.zsh;
 };

  services.xserver= {
    windowManager.i3 = {
      enable = true;
      configFile = /home/ninjatrappeur/.config/i3/config;
    };
  };

  system.stateVersion = "18.03"; # Did you read the comment?

}
