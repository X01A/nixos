{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "56cf75c8bc51b66f02edcad5701354870f493584";
    fetchSubmodules = true;
    sha256 = "sha256-vrrGxhyCnTp/xqJzIK0u8eVlfsg/F5B10/6wEjhoBiw=";
  });

  cargoHash = "sha256-ZSVl/UwN5eSXVswg/4M9sOQ8g+uNSjCWcrWV9hIJpg0=";

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
