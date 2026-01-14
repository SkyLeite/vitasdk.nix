{
  description = "VitaSDK core & libraries packaged for Nix";
  nixConfig = {
    extra-substituters = [
      "https://hbnix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hbnix.cachix.org-1:KKKoJ7QLIYjMC1CRLFgeTwfO9bKzSgu2G8BbyZQIe/M="
    ];
  };

  outputs = { self, nixpkgs }: rec {
    packages = builtins.mapAttrs (k: v: import ./vitasdk-packages.nix { pkgs = v; }) nixpkgs.legacyPackages;
    defaultPackage = builtins.mapAttrs (k: v: v.vitasdk) packages;
  };
}
