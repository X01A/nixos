{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "edb3cdfc1507fe306caa74c2b8f32e2841861d7c";
    fetchSubmodules = true;
    sha256 = "sha256-KLUVzd+bc8bWo1GHYyZWxoQJf9tsGlkB159arQUOrBE=";
  });

  cargoSha256 = "sha256-LPfWsRoaySkFR/WewsjrGyWU5GMhs2StL+Cd1UhWyLM=";

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
