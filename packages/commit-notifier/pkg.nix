{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "451532c53498c5f040a3577b2b4a8cf56e7b2a71";
    fetchSubmodules = true;
    sha256 = "sha256-hE7m86Jhzo3IJ39QFLGg15o1rrfwJHTzEsXjodN2MAY=";
  });

  cargoSha256 = "sha256-Pup5kClVYDPPaVarkOPdPZMPT/yIDdW2uSVlb9EOpaQ=";

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
