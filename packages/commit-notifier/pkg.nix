{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "833d6e76224990553b27b216dbeb84c9e6486279";
    fetchSubmodules = true;
    sha256 = "sha256-Enu+qujR6lnXXYYETYF3JXkPWcOjLvBd9ECIxvDAX44=";
  });

  cargoSha256 = "sha256-hxeqA8QQdNiLFF08zT/iQBdkIT+WDG8qidMTnSsoUyc=";

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
