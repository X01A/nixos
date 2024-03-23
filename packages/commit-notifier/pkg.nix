{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ae0c1fd1a09dc3d06179edf39b64432f526af493";
    fetchSubmodules = true;
    sha256 = "sha256-MbtvRep1i703olthZVsEbeDyRmuvwojDzTN/fevCSIg=";
  });

  cargoSha256 = "sha256-HyKuVTdJ5lFpzFmKWy1Zi6C9jv/lfnCSWKpfjwmkrgc=";

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
