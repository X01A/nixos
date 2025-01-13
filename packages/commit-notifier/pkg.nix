{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d6faaa388178dc47655655ca4f3ce9c4e5ccb2ac";
    fetchSubmodules = true;
    sha256 = "sha256-kDQdUBfnh9BkSXjL075XOXE4kT9NIRW1hW65l5uBDew=";
  });

  cargoHash = "sha256-WG4+Lc5ZuYLCznpJQ0wCxEQzTFwrODqyAjCBLPh8Wo8=";

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
