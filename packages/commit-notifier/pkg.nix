{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f811d7fc9b5fc7b8cd3fddfdd5a4336d6be3e00f";
    fetchSubmodules = true;
    sha256 = "sha256-UUcxIGBjh7XPOuC5c9T8OO5IJkLw57tNUjZyUUTdZtc=";
  });

  cargoSha256 = "sha256-skcWeIDrSETz7BRO2jHnHhVtd7nDAA3rOEqxl0ePmGs=";

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
