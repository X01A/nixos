{ source, rustPlatform, pkg-config, openssl, zlib, perl, llvmPackages, llvm, clang, git }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src cargoLock;

  LIBCLANG_PATH = "${llvmPackages.libclang.lib}/lib";
  buildInputs = [
    openssl.dev
    clang
    zlib
  ];

  cargoBuildFlags = [ "-p" "neard" ];
  doCheck = false;
  nativeBuildInputs = [ pkg-config perl llvm clang git ];
}
