{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5bffc61ab459c922bf8686ce101f038e3533804c";
    fetchSubmodules = true;
    sha256 = "sha256-HMzBI64Cpa5bNNZX+MgQps1GRpdauBVYEjTfycUTT+Y=";
  });

  cargoSha256 = "sha256-jDLjG312LxGEsEvhHzX3vndJeichpbuqkhG3VGye1wg=";

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
