{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }: let
    out = system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShell = pkgs.mkShell {
        buildInputs = [pkgs.nodePackages.reveal-md];
      };
    };
  in
    with utils.lib; eachSystem defaultSystems out;
}
