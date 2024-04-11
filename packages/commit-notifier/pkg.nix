{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3260ede777c08423652e66f541fcefed40e0efef";
    fetchSubmodules = true;
    sha256 = "sha256-PiNLnkfg5D2Z/JVPNVWymLB15LapBFUqr+hXZm1MRBY=";
  });

  cargoSha256 = "sha256-7lY83K2ibN7mxtNDzniUa6KfEyx7b00C2v/BJ08l8b0=";

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
