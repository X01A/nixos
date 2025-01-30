{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ab48bec59e587d3bf0401ada5b873e9ae20c5fc1";
    fetchSubmodules = true;
    sha256 = "sha256-HR0fby8ZKpo551+kVwgyHLeIH8m/zL3prl46Nou8yCQ=";
  });

  cargoHash = "sha256-iGr0bDO6kRiet9XvPkz5GSTXQeEZ9MM/HYiAkvfTOn4=";

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
