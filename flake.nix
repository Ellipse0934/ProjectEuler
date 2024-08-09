{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    };
    outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
       devShells.${system}.default = pkgs.mkShell {
           buildInputs = with pkgs; [ julia-lts ];
       };
    };
}
