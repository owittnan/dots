{
  description = "My Darwin system flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nix-darwin = {
    url = "github:LnL7/nix-darwin";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Oscars-MacBook-Air-2
    darwinConfigurations."Oscars-MacBook-Air-2" = nix-darwin.lib.darwinSystem {
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/Oscars-MacBook-Air-2/default.nix
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Oscars-MacBook-Air-2".pkgs;
  };
}
