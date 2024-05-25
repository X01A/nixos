{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "85ecbe94006868dfc4bb0930af690ae01a71b99c";
    fetchSubmodules = true;
    sha256 = "sha256-DNN+o7lmHIBv/tStyLcj+DKHz8R3x7Gz2G9WRHJ0YXo=";
  });

  cargoSha256 = "sha256-hX1auRD8SgWp7C+6jM+KcgjPbjk+mxOtND7g9EbqVXg=";

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
