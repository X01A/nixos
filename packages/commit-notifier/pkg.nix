{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "29c9a050bcec254a8e8b48d331efec12cfbaeab7";
    fetchSubmodules = true;
    sha256 = "sha256-wKB4IqQugnLj3gJv2YEGR1Dy5nWp8w4cxvhX5BMwUJw=";
  });

  cargoSha256 = "sha256-2GE9HJzYcFBphPq2GcAV13N1bK2sFXwE7ZOulRM7OP8=";

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
