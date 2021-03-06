{ config, lib, pkgs, ... }:
{ 
  environment.systemPackages = with pkgs; 
    gnome3.corePackages ++ gnome3.optionalPackages ++ 
    [
       wget vim terminus_font groff
       mpv pavucontrol git python36 ffmpeg
       i3blocks i3status gnome3.gnome_terminal
       lm_sensors sysstat cmus acpi nixops
       alsaUtils unzip p7zip unar less
       xorg.fontadobe100dpi xorg.fontadobe75dpi 
       dbus grml-zsh-config wireshark
       gparted taskwarrior timewarrior tasksh 
       transmission_gtk neomutt keepassxc ag htop
       ntfs3g exfat exfat-utils chromium
       gnupg hlint udiskie cabal2nix syncthing
       youtube-dl gimp inkscape shotwell
       clementine liferea neovim logkeys ntp
       libreoffice wxhexeditor calibre
       firefox signal-desktop tor-browser-bundle-bin
       fixedsys-excelsior obs-studio newsboat
       lynx vimPlugins.vimproc wireguard
       gitAndTools.gitFull guitarix
       jack2Full graphviz
       #
       # Extra Packages coming from the extra-pkgs overlay.
       # (Haskell dev tools + random stuff missing from nixpkgs)
       #
       # See ./extra-pkgs/default.nix for more informations.
       #
       extra-pkgs.patchwork extra-pkgs.stylish-haskell
       extra-pkgs.ghcid extra-pkgs.weeder
    ];
}
