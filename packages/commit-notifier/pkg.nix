{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9066b05a22df03a7f897b90169520f57e68ff3f8";
    fetchSubmodules = true;
    sha256 = "sha256-DOwMmFwmGAyP6Y41SBrP9ATwtT9ZU3yHH1DntWI6t3o=";
  });

  cargoSha256 = "sha256-1+8zM3upVDqsRGGwUBpykJM3lOSt2EFV/Fu3zjywB3s=";

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
