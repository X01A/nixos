{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c759ecaeb2ca36c2fde62d6516c5c95a5f284537";
    fetchSubmodules = true;
    sha256 = "sha256-+S6a0NHhS6DtpEiHh8jgLYNMlgWjgI6S4Z5VID21Nqg=";
  });

  cargoSha256 = "sha256-rIi++/NNqlypySjY6PevJGSPu8kM72kngl+vh7IgjOk=";

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
