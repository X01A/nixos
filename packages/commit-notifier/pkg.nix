{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "668af7b97eaffc87ee8fe29622c9ce32ce9bed7d";
    fetchSubmodules = true;
    sha256 = "sha256-Z6l9u9QPlQVLy5IiIuBZTefB48fK7jYF+3TxE/0NeXM=";
  });

  cargoSha256 = "sha256-g8Gzh1CgewdZiQ+/K5EZ3MsnJornrGymraoxwaQFviA=";

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
