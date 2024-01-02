{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b9436cf1b0f3547a9ebeb8decce4eb3b67c464aa";
    fetchSubmodules = true;
    sha256 = "sha256-WonShXkTQfsBBG6Ym7Mm1OB3F40TQ2Nn1TtQa57vWWU=";
  });

  cargoSha256 = "sha256-TBIrgeKoYu6Hhu5Bw5cNfKincvzSeLlFSjeq+4uRm+M=";

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
