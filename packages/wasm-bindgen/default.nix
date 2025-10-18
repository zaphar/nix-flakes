{
	version,
	cargoHash,
	crateHash,
	fetchCrate,
	rustPlatform,
	buildWasmBindgenCli,
}:

buildWasmBindgenCli rec {
    inherit version;
		src = fetchCrate {
				pname = "wasm-bindgen-cli";
				inherit version;
				hash = crateHash;
		};
    cargoDeps = rustPlatform.fetchCargoVendor {
        inherit src version;
        pname = "wasm-bindgen-cli";
        hash = cargoHash;
    };
}
