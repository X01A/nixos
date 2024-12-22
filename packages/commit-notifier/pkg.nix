{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "69a80812e5e6a3c51f826423d87e389aaa05d6fa";
    fetchSubmodules = true;
    sha256 = "sha256-eRsL/7TyZnNl9TqH4oiILpB4AmSS6ijDE+Pb4LMJPzw=";
  });

  cargoHash = "sha256-b65llr2044BMSgTVEd263EMN7ESZcDKzggwMUU3Umkk=";

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
