{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4fd8dbbf656c1a21a2a77b6a48bac7b01d3f572e";
    fetchSubmodules = true;
    sha256 = "sha256-BkxeRXcFlVyYewjizH+l18eNuNAoSYEa/2S3In+WA4Y=";
  });

  cargoSha256 = "sha256-ceInadPvSPB43MHg2B+/GOhw8pXaF/pdhdbk0PoHQlA=";

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
