# I use this overlay to add some packages missing
# in nixpkgs.
#
# Why are they not upstreamed? Either I tried and the PR
# was not accepted, either the package is too hacky as it is
# to be upstreamed.
#
self: super:
{
  extra-pkgs = {
    patchwork = super.callPackage ./scuttlebutt/patchwork {};
    #
    # Not maintaining proper Haskell tools overlays anymore...
    #
    # Too time-consuming. Using the haskell nix infrastructure
    # ones instead. It's not up to date, but at least it builds...
    #
    stylish-haskell = self.haskellPackages.stylish-haskell;
    ghcid = self.haskellPackages.ghcid;
    weeder = self.haskellPackages.weeder;
  };
}
