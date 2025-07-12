{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-07-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "75c49e871e56ae9e43094b0fe398c3a8fd265932";
    fetchSubmodules = true;
    sha256 = "sha256-8FRVMNNRzDLzUbyxz55mzIDWIDisO9B2YL8fTmRCopY=";
  });

  cargoHash = "sha256-OxjT5+kj2wcUfKvTWStE28zwmn+OFHBCAeaGe4NscRA=";

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
