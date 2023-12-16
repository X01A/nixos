{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d5392641c382c191bf7777ad2a44f103c8a045e4";
    fetchSubmodules = true;
    sha256 = "sha256-58Cuo3tCirgGw8BP7K4i05hK4z9reahFrVxXoJAkT4M=";
  });

  cargoSha256 = "sha256-NEqniGyDnIBEpy9dFi039ATnB+Y0vqnxKtoew5FpEds=";

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
