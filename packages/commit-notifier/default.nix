{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-01-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0d6edaf4ac1148ce11a5a661b04eb7f3ca863ad6";
    fetchSubmodules = true;
    sha256 = "sha256-no/2WvjeCS14f7Pz+gEpC4D3lozvxtem1BgDRtZPoqk=";
  });

  cargoSha256 = "sha256-LSuH7Y6yVC614z9YqaqCFMFJhfpL0AZd1wapEFAqOKs=";

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
