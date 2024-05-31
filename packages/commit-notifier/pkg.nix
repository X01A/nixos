{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c8b30d493a786b09ee744341a4c2f91101277527";
    fetchSubmodules = true;
    sha256 = "sha256-CrtdXT9FdPPOGpSoLKQ4ir51egXpNkDbfVrjFxTU7tM=";
  });

  cargoSha256 = "sha256-UW1k8m6+JaTuq3A6wsMZdcr9zEqvWdG5k8i/mC4hJaw=";

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
