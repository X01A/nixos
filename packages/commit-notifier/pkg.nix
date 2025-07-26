{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-07-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4cf92009a2e7bdf9cdffd5a19f350f06ba476895";
    fetchSubmodules = true;
    sha256 = "sha256-LC2KBGK+L7uX9UW9daI8KnysQ0T2cp3gsrJw5WnKCc4=";
  });

  cargoHash = "sha256-1/B8BY9mwV4vDD8bkZhnF3cpvnmA7zsG9MSRP5TOqMI=";

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
