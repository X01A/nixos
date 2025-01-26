{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f90112cdad84cf08e26557a49e849c43a74e96f1";
    fetchSubmodules = true;
    sha256 = "sha256-8VVlrUtvtD3bral4gcaHfyxP6Ut2cNoWp+110wz6jUs=";
  });

  cargoHash = "sha256-ERN917nuVbUHRe+XO2vz9HdQOrpfUd/rtFDRSDvi4/I=";

  RUSTC_BOOTSTRAP = 1;

  buildInputs = [
    openssl
    sqlite
    libgit2
    zlib
  ];

  # TODO libssh2-sys failed to pass test
  doCheck = false;
  nativeBuildInputs = [ pkg-config ];
}
