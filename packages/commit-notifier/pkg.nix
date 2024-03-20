{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "83960fc1aa5027b9472886b4565de9a0424c5aef";
    fetchSubmodules = true;
    sha256 = "sha256-Dw9xsr9xJ81dX0Z9G6nmDShzkI5kmT5EC/GFbIMMGfw=";
  });

  cargoSha256 = "sha256-EGuFNGJRhQWtVhkAynYfUaYHTJHVXUqMVOHKU3bGqBU=";

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
