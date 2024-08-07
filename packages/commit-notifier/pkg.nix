{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4883519bfd9c60ceb739bbe19a7090325e3b5e3b";
    fetchSubmodules = true;
    sha256 = "sha256-GLNPZ0Sm74eOAd0D9dV2ikbkY0kGc2CEdJTmAx9x5jU=";
  });

  cargoSha256 = "sha256-6NB2ZOHuxzM2s94BPwIFXEYQA6Q31XI+zp93+bl6Iug=";

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
