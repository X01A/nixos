{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8a80f06ab55733da4c2b4c7ee4bdd92d32496faf";
    fetchSubmodules = true;
    sha256 = "sha256-G2tnhYuzCZY/8XANz9pReFjqYJ1zyHq7f2/339/8QXM=";
  });

  cargoSha256 = "sha256-kLcNbILgJYInmJdw2neT/Ary8F0sZfKbrgqhH6c5fc8=";

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
