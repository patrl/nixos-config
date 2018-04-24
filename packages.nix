{ config, lib, pkgs, ... }:
{ 
  environment.systemPackages = with pkgs; 
    gnome3.corePackages ++ gnome3.optionalPackages ++ 
    [
       wget vim terminus_font groff
       mpv pavucontrol git python36 ffmpeg
       i3blocks i3status gnome3.gnome_terminal
       lm_sensors sysstat cmus acpi
       alsaUtils unzip p7zip unar less
       xorg.fontadobe100dpi xorg.fontadobe75dpi 
       dbus grml-zsh-config wireshark
       gparted taskwarrior timewarrior tasksh 
       transmission_gtk mutt-with-sidebar keepass ag htop
       ntfs3g exfat exfat-utils chromium
       gnupg hlint udiskie cabal2nix syncthing
       youtube-dl gimp inkscape shotwell
       clementine liferea neovim logkeys ntp
       libreoffice wxhexeditor calibre
       firefox signal-desktop tor-browser-bundle-bin
       fixedsys-excelsior obs-studio newsboat
       lynx vimPlugins.vimproc enhanced-ctorrent
    ];
}
