{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1497e7c62e982839966bdb8df25bd44e3e56d581";
    fetchSubmodules = true;
    sha256 = "sha256-yErg6BujUNojBDytnKRsbjjikow22H/a3h8deyuubF4=";
  });

  cargoSha256 = "sha256-3DujpP2QnGQR1N8mywvvhQ/qOKjdh3zyZRQS8CWTVqU=";

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
