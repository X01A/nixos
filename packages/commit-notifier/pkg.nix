{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e36c98d8a00dc720a8892b9437210b05631bf661";
    fetchSubmodules = true;
    sha256 = "sha256-wgTXBtRT46McJzNb8O2oCXL5WqPv4Ze9yVzaoV0HUh0=";
  });

  cargoSha256 = "sha256-rd/07oeGib03unsPecvIYHIH7PlzKernEvD7qB3wQgM=";

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
