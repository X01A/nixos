{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6a059975a2de4db9c9a1fde56c8affeee556b60b";
    fetchSubmodules = true;
    sha256 = "sha256-F8uw2yj/RSjjtIlc7QAxSePsEUvXIuE6xvqm/ZryRpI=";
  });

  cargoSha256 = "sha256-niMkDJ6QimiRggBQtCpta32WlA2CmXxcdYn3QfcDWZ0=";

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
