{ lib
, rustPlatform
, pkg-config
, lua
, src
, pkgs
}:

let
  # Build the Rust library
  lua-json5-lib = rustPlatform.buildRustPackage {
    pname = "lua-json5-lib";
    version = "2024-12-01";
    inherit src;

    cargoLock.lockFile = ./Cargo.lock;
    
    postPatch = ''
      cp ${./Cargo.lock} Cargo.lock
    '';

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = [
      lua
    ];

    meta = with lib; {
      description = "JSON5 parser for Lua/LuaJIT written in Rust";
      homepage = "https://github.com/Joakker/lua-json5";
      license = licenses.mit;
      maintainers = [ ];
      platforms = platforms.unix;
    };
  };

  # Create the vim plugin package
  lua-json5-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "lua-json5-nvim";
    version = "2024-12-01";
    inherit src;

    # Copy the Rust library to the plugin directory
    postInstall = 
      let
        ext = if pkgs.stdenv.isDarwin then ".dylib" else ".so";
      in
      ''
        mkdir -p $out/lua
        cp ${lua-json5-lib}/lib/*json5${ext} $out/lua/ || true
        # Also try alternative library names
        cp ${lua-json5-lib}/lib/libjson5${ext} $out/lua/json5${ext} || true
      '';

    doCheck = false;

    meta = with lib; {
      description = "JSON5 parser Neovim plugin with Rust backend";
      homepage = "https://github.com/Joakker/lua-json5";
      license = licenses.mit;
      maintainers = [ ];
      platforms = platforms.unix;
    };
  };
in
{
  inherit lua-json5-lib lua-json5-nvim;
}
