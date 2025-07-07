{platformLinuxSrc, platformDarwinSrc, src, pkgs, system, version }:
 let
  architectures = {
    "x86_64-linux" = "linux-x64";
    "aarch64-darwin" = "darwin-arm64";
  };
	platformSources = {
    "x86_64-linux" = platformLinuxSrc;
    "aarch64-darwin" = platformDarwinSrc;
	};
	arch = architectures.${system} or (throw "unsupported system: ${system}");

	platformPackage = "opencode-${arch}";
	platformSrc = platformSources.${system};

  opencode = pkgs.stdenv.mkDerivation {
    pname = "opencode";
    inherit version src platformSrc;

    nativeBuildInputs = [ pkgs.makeWrapper ];

    installPhase = ''
			set -x
      mkdir -p $out/{bin,lib/{opencode-ai,${platformPackage}}}
			#tar -xzf $src --strip-components=1 -C $out/lib/opencode-ai
      cp -r $src/* $out/lib/opencode-ai
			#tar -xzf $platformSrc --strip-components=1 -C $out/lib/${platformPackage}
			cp -r $platformSrc/* $out/lib/${platformPackage}
      ln -s $out/lib/${platformPackage}/bin/opencode $out/bin/opencode
      chmod +x $out/bin/opencode
      wrapProgram $out/bin/opencode --set OPENCODE_BIN_PATH $out/lib/${platformPackage}/bin/opencode
    '';

    meta = {
      description = "AI coding agent, built for the terminal.";
      homepage = "https://github.com/sst/opencode";
      license = pkgs.lib.licenses.mit;
      platforms = [ system ];
    };
  };
in
{
  inherit opencode;
}

