{
  description = "NixOS: ThinkPad X1 Extreme Gen 2 (KineticWE)";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kineticwe.url = "gitlab:theblackdon/kineticwe";
  };
  
  outputs = { self, nixpkgs, kineticwe, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./configuration.nix
	  kineticwe.nixosModules.default
	  { programs.kineticwe.enable = true; }
        ];
      };
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
    };
}
