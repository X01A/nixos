{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "91f3c9c1a2fdc152e8ef13f0d88ceeddfe4df5f9";
    fetchSubmodules = true;
    sha256 = "sha256-dvPY7crfscL4jzFRBWaDk8HM5TOwQI8GIArosmYSNG8=";
  });

  cargoSha256 = "sha256-K4RselxevdTDz/UEEtIKQAYiKV8CqKHfxZJlKyXKoYY=";

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
