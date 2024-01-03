{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0e74602b9304507ddca1391ddcf49007575b7f2e";
    fetchSubmodules = true;
    sha256 = "sha256-6rUaeD3TGKCjRBRG0y/6XQKpbsfvveUjHZkdDQXK2ok=";
  });

  cargoSha256 = "sha256-HJ5s22mD4LJULEQ8hkBsOad2VGhGVz/nquS5FdFWR0A=";

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
