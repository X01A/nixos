{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "50ee744a67553209e3c8f5c149aad6c33c92c32e";
    fetchSubmodules = true;
    sha256 = "sha256-ldMnSRVpxGx2WNXBfdjEwi/apBd76DMOncUh4+BIe/8=";
  });

  cargoSha256 = "sha256-EuitKqQ9mAlbun6RzH9q+Ag1nwLz5idC8Tjf+8n3auI=";

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
