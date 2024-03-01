{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "058ca1fbb0682c6c9ec3edf30b3ff5f28c5391d1";
    fetchSubmodules = true;
    sha256 = "sha256-xAn2l2xFq/9gqCO+X0f5tO+PJUUwsY1oWrjL5slrQ4M=";
  });

  cargoSha256 = "sha256-dMO1gVEDOmWETO55aFILLehWLNKGnnBFJpfMFYxN3ao=";

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
