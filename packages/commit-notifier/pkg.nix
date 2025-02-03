{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ea533b5c6902ad7ec311b1970fe9f0b71ee799ef";
    fetchSubmodules = true;
    sha256 = "sha256-SZefgh4FlAheDqZI1RLVh7S8BFqNrIpVm41jqrDu7RM=";
  });

  cargoHash = "sha256-yXeu/9c/Nl6lJbFWAOe+4CKVGCzXSg3uyXETF5RjdYs=";

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
