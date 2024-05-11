{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5e2001c82e3ebf02b28d0da697a92806ebcd635e";
    fetchSubmodules = true;
    sha256 = "sha256-aHj/l5527XaR3aAsIiU3dtuNI7+bNfcSvCPYB+/VGQQ=";
  });

  cargoSha256 = "sha256-e2ql4Z4EHOvcZSd0DsPyF7KoZ6zX9ml4j94qdu7o8ec=";

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
