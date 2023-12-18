{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e0c7b17bb2c8971993755cd25b27f4b19a50f399";
    fetchSubmodules = true;
    sha256 = "sha256-ojNOrXYYN2zZLVu57dLxEyKyZN2z70lbgueV0EWk/mE=";
  });

  cargoSha256 = "sha256-XweFxkU/co/+e4/eN1ly65CSsvEyHHu0xOC8ow1WBAc=";

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
