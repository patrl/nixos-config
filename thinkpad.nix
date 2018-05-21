{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./core.nix
      ./thinkpad-hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.wireguard ];
    loader.grub = {
       enable = true;
       enableCryptodisk = true;
       version = 2;
       device = "/dev/sda";
    };
  };

  networking = {
    hostName = "thinkpad-nix";
    firewall.allowedTCPPorts = [ 8000 ];
    networkmanager.enable = true;
  };

  networking.wireguard.interfaces.wg0 = {
    privateKey = builtins.readFile ./wgprivatekey;
    ips = ["192.168.3.3"];
    peers = [{
      endpoint = "alternativebit.fr:51820";
      publicKey = "YLIeSCLTy4PP5CkTp84lb52XWcYcz7S0SHkl7q2JVVQ=";
      allowedIPs = ["0.0.0.0/0"  "::/0"];
      persistentKeepalive = 25;
    }];
  };

  users.extraUsers.ninjatrappeur= {
      isNormalUser = true;
      home = "/home/ninjatrappeur";
      extraGroups = [ "networkmanager" "wheel" "audio" "video" "storage" "optical" "wireshark" ];
      shell = pkgs.zsh;
  };

  services.xserver= {
    libinput = {
      enable = true;
      disableWhileTyping = true;
      scrollMethod = "twofinger";
      tapping = true;
    };

    windowManager.i3 = {
      enable = true;
      configFile = /home/ninjatrappeur/.config/i3/config;
    };
  };

  system.stateVersion = "18.03"; # Did you read the comment?

}
