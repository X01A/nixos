{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1a68791a6309bf5d87bc51058ae5ed05fa0d929c";
    fetchSubmodules = true;
    sha256 = "sha256-WHvLXPuoNFNjpn1RcLfVrSR5I18Su4Ebi6FJWbm6LdA=";
  });

  cargoHash = "sha256-WI91mfQsVq9YlJw8ANx/oHTNIIIUvJZAN24oEfW5/+U=";

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
