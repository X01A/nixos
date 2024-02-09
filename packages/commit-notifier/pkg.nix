{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f9f5e8a5f90608462864f48aa0826ea60cb6e702";
    fetchSubmodules = true;
    sha256 = "sha256-SV08gr9FWE5Mamk9kU57zre9zYjV8ndLXRnDI8yeds8=";
  });

  cargoSha256 = "sha256-smqdczp/KQfy9lG1B4y5dHmtnn1epEq5wiZLFTM3YEk=";

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
