{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-06-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8f781a1851a17fe8f7d48467192a65f303ec5664";
    fetchSubmodules = true;
    sha256 = "sha256-po711J9vjNsUhlpkIAcy8bGh/249egbsqUVFcWi1Mho=";
  });

  cargoHash = "sha256-eP52zUSlv5OpmoUarrn0j7RdbMUi9zUw0xLJQymcot0=";

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
