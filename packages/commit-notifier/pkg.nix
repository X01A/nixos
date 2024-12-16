{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "27c0388383d9b8d3146a4675bb949482b4becac0";
    fetchSubmodules = true;
    sha256 = "sha256-D3e9xnp/cfCT5PpJSGRQ+sgoigG8sZaTvqVl+J2ujXo=";
  });

  cargoHash = "sha256-Af3N98Mo/l4wAuaKqsK6LT79t6J+M3tIBGoiSCD2Gd4=";

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
