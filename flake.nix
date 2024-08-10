{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    };
    outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      julia = pkgs.julia_110-bin;
    in
    rec {
        packages.${system}.default = pe;
        pe = pkgs.writeShellScriptBin "pe" ''
            julia --startup-file=no \
                  --color=yes \
                  --project=src/pe \
                  ./src/pe/main.jl $1 $2
        '';
        devShells.${system}.default = pkgs.mkShell {
           buildInputs = [julia pe];
        };
    };
}
