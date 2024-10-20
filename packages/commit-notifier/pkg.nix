{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c3053143a864a57cc7c6938bcbf141ebd140a599";
    fetchSubmodules = true;
    sha256 = "sha256-b6qCeg20SdJhb/pUy3gVLgcK0N6bQHv76hB0G/4QpwI=";
  });

  cargoHash = "sha256-AGLkZVvkgXeJb3useIKw1ZME2TOvzmeglF/FkKjmjJ0=";

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
