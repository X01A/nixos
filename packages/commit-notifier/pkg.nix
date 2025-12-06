{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-12-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1ff528ae1baed8234fec29048c80bee158136718";
    fetchSubmodules = true;
    sha256 = "sha256-ERP/bT0UeFLFicUDgSKMs+nwKvqRy/3vC23RpC5b+5I=";
  });

  cargoHash = "sha256-ZBhKwFseSMQ9rUjF+6qxhfs+PidiPSZekTfFbQA9XbQ=";

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
