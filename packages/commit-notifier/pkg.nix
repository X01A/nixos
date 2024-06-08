{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3174d87204ac0d73a6ae1fdf3c2381fa685afd22";
    fetchSubmodules = true;
    sha256 = "sha256-2/oYQB2lqfFvgdAaFxHsn7DaW9jPktAgKDvUMaqH08A=";
  });

  cargoSha256 = "sha256-GLp8UxXKjDdf0WVpzulve5oSk16R+F9oIXp7Z2bhqss=";

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
