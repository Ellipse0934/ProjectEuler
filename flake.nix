{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/24.05";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = inputs:
        inputs.flake-utils.lib.eachDefaultSystem (system:
            let
              pkgs = inputs.nixpkgs.legacyPackages.${system};
              julia = pkgs.julia_110-bin;
            in rec {
                packages = {
                    pe2 = pkgs.stdenv.mkDerivation {
                        name = "pe";
                        pname = "pe";
                        src =./src;
                        buildInputs = [julia];
                        buildPhase = ''
                            mkdir -p $out/src/pe
                            cp -r $src/pe $out/src
                            mkdir -p $out/.julia
                            JULIA_DEPOT_PATH=$out/.julia julia --project=$out/src/pe -e "\
                                using Pkg; \
                                Pkg.instantiate();"
                        '';
                        installPhase = ''
                            echo "julia -e \"using InteractiveUtils\
                                    versioninfo()\"" > $bin
                                    '';
                    };
                    pe = pkgs.writeShellScriptBin "pe" ''
                    julia --startup-file=no \
                          --color=yes \
                          --project=src/pe \
                          ./src/pe/main.jl $1 $2
                '';
                };
                checks.my-check = pkgs.runCommand "my-check" {
                    src=./.;
                    buildPhase = ''
                        echo "Building"
                        mkdir -p $out
                        cp -r $src $out
                        ls -la $out
                        echo "Built"
                    '';
                    phases = "buildPhase";
                    buildInputs = [pkgs.julia packages.pe];
                } ''
                    ln -s $src/src src
                    test $(pe run 1)
                    touch $out
                '';
                devShells.default = pkgs.mkShell {
                   buildInputs = [julia packages.pe];
                };
            }
        );
}
