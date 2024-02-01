{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "42482e10ff768d6da3aecce47e758542dbb67803";
    fetchSubmodules = true;
    sha256 = "sha256-CAHbTE2CUT8Qe/wdsgIr6ZwDuOmemgMeSwllJc1MIiw=";
  });

  cargoSha256 = "sha256-TxlJYCq8oFzAeyDjAXczom4Y5zhxIwQYqPuIyNF7YHA=";

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
