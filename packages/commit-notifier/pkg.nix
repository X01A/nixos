{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "70cea1259b6aacd134171e9e6d35fe065888a33d";
    fetchSubmodules = true;
    sha256 = "sha256-smNmgwb5nx72MIDYFIQ1WbDUHH+aAWHyp4MN4Vt4naI=";
  });

  cargoHash = "sha256-oqhbD5fvqFpuOwakkWMmM1mm0fqjJMSaxgEZjDePZr8=";

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
