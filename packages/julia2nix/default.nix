{pkgs, src}:
  with pkgs; runCommand "julia2nix" { buildInputs = [makeWrapper]; } ''
    mkdir -p $out/bin

    cp ${src}/julia2nix $out/bin/julia2nix
    cp ${src}/gather_packages.py $out/bin/gather_packages.py
    cp ${src}/extract_artifacts.jl $out/bin/extract_artifacts.jl
    cp ${src}/nix_util.py $out/bin/nix_util.py
    cp -r ${src}/templates $out/bin/templates

    wrapProgram $out/bin/julia2nix \
     --set PATH ${lib.makeBinPath [nix python3 julia-lts]} \
     --set NIX_PATH nixpkgs=${pkgs.path}
  ''
