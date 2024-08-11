{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f9cd86a70d64136598bb97be36094a76d415dad9";
    fetchSubmodules = true;
    sha256 = "sha256-scOyrJkvbhNBCiO4oxZqEw5f7NzVdqJ9DZknaJgdsB4=";
  });

  cargoSha256 = "sha256-k8JKw6h5xwOtpi/qFYxRUZdgE8DROFELdJWSjSNinYk=";

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
