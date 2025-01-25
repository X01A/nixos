{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d9d3c4910986782dad81a82f89410cca2623a17a";
    fetchSubmodules = true;
    sha256 = "sha256-wv/2cHjR1/GDyw91bbW0vaFel6HhSYZ6ipP2eWkXVAY=";
  });

  cargoHash = "sha256-F4BVzXTmy8+Dpqi1KnQb01B3eJu+dPl6gbsxpWFeZgM=";

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
