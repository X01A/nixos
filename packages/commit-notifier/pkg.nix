{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "795e92faad911a772ccf4081a9830c2c4e51e680";
    fetchSubmodules = true;
    sha256 = "sha256-AOf8jIsj2AlMbbt1zLpwTTtiNtz9yJiEOB8iRAPbXRM=";
  });

  cargoSha256 = "sha256-2a4eTFk/XXxUuYEyXh1RYFlJFouYHM+fXTBFF9oaLl4=";

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
