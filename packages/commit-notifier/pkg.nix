{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "42a444b5168ac5a6489148a67de20e6ae908eb36";
    fetchSubmodules = true;
    sha256 = "sha256-mDxpPmCKFOzUlGh7tfrD/lbn0wygM9jBmypGfqIKdYg=";
  });

  cargoSha256 = "sha256-oKr9sx5TNRefdpQvxlpbaKD+AoiNCen2bA9lFzTeqbQ=";

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
