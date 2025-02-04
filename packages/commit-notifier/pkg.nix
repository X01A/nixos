{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "507f319a4e2d52b05dd7850f36b58bd67862c89c";
    fetchSubmodules = true;
    sha256 = "sha256-MWUKRAIpgRp13k5ywN2SqWwAqIr0Nhu5ig+I4ENPtvw=";
  });

  cargoHash = "sha256-DB98mTKNZ9IJibDgDKj1KfSbZxCATCG4nUQs/Hni1+c=";

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
