{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d4b07e61f919b8f3d217c67deddb9584f36aab72";
    fetchSubmodules = true;
    sha256 = "sha256-0701rUb5GP+uiJDrsT0sXRtAzgAuY30tt8kiRaZDroU=";
  });

  cargoHash = "sha256-OSSCdL+HoNfsAsj0cl01zJoyPCqB+PJ8s4fQm49/+3c=";

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
