{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7dba9fb3ef1abe6cbde3c266f81aadc91a11360b";
    fetchSubmodules = true;
    sha256 = "sha256-O43fj5OCz8y9Ug48uQkdjsfGsdkvxEjWrYz4zmi0HmE=";
  });

  cargoHash = "sha256-9UKp9BwIf2Fm2488Z30fmU5JPC6qgDjM3071gUEUz/c=";

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
