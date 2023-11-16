{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c3c624578abf46a15b60dc7fc9a9becf988b936b";
    fetchSubmodules = true;
    sha256 = "sha256-y/VYdjd1ehF5z2BqCFvudqzKe4hL1EKOUtwjAGpICCg=";
  });

  cargoSha256 = "sha256-4KNyfg7w9M+85R3MtXkcNFXE9dZOdArS3me0cs/Uql0=";

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
