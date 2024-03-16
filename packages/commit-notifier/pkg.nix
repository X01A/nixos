{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "93c5e81a177fd042438eee0c0291255d61026689";
    fetchSubmodules = true;
    sha256 = "sha256-6PdoGSWAK8XEsDamQK+76AeRadALopf5ZogyuiJPEXU=";
  });

  cargoSha256 = "sha256-5WxrczKMbYUmUoPLJuYZFzVE0zvapqngQ1WsnxgyJW0=";

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
