{ config, pkgs, ... }:

{
  programs = {
      ssh = {
          knownHosts = [
            { hostNames = ["github.com" "207.97.227.239"]; publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==";}
            { hostNames = ["[alternativebit.fr]:8726" "[2001:41d0:2:2f1e::1]:8726"]; publicKey = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAN/8dNTM0arOd2Np1+5E525y8rl2hscZr3NohUK4EHiasZpBZHUh4gaHNr7F1kFGuzCbCUMmJdIAoFzTCGxfp8=";}
          ];
      };


      zsh.interactiveShellInit = ''
          autoload -Uz compinit
          compinit

          #Autocomplete style
          zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
          zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
          zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                                         /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

          # End of lines added by compinstall
          # Lines configured by zsh-newuser-install
          HISTFILE=~/.histfile
          HISTSIZE=1000
          SAVEHIST=1000
          setopt autocd

          #Alias
          alias c="clear"
          alias top="htop"
          alias vi="nvim"
          alias m="make -j4"
          alias sb="stack build"
          alias se="stack exec"
          alias ns="nix-shell"

          export EDITOR=nvim
          #Add custom software to path.
          export PATH="$HOME/.local/bin:$PATH"
      '';
  };
} 
