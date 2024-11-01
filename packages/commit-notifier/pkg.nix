{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "122b134442d2a5b15682836c179ec1a08c17b00b";
    fetchSubmodules = true;
    sha256 = "sha256-nBTNSqoixqzwOQ+Kmb0PSLqR0LLjMxuU6FHgD0xGA30=";
  });

  cargoHash = "sha256-bRQwgOs52XNDrYRggpqWrYg1v31gtwr9OjNk1mrnJM4=";

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
