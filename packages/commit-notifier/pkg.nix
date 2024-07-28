{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0f7e5c90184ef47da41560f7175dcbdfaf3e6a06";
    fetchSubmodules = true;
    sha256 = "sha256-DPo9K9tpYXU7JYfUz8ZD4XWNPmPsObWSWdrLmbvq4uA=";
  });

  cargoSha256 = "sha256-Ay/ojS+//fcphrO1dOBHe3Dck4jhAGbjJq0oPMKtpJE=";

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
