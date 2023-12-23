{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "174afa095308824f24aed06dce89597f651059b5";
    fetchSubmodules = true;
    sha256 = "sha256-jX12EhFVDoBXbqcHAsgiJuUcSYkvTMTWWhwwQMPzBaA=";
  });

  cargoSha256 = "sha256-014lqC6Jo6Fs+1W62TNfhyhRqLEqx+PiBcK91Cdmd0Y=";

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
