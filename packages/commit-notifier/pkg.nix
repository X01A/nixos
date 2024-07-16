{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a0daa25e5bcb9557822193c4653f9444741477e9";
    fetchSubmodules = true;
    sha256 = "sha256-wOgLvUvlIrYCQlFvNwC3S5Xhf7vY47YepkiDkotVWuw=";
  });

  cargoSha256 = "sha256-3qXYymbod+KeMyD6O6E72hTUEptwDr1EFu8NPBKH0cI=";

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
