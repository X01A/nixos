{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-05-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8b9b6f8ea8b636722bdaa4b7f9785cbcd307e635";
    fetchSubmodules = true;
    sha256 = "sha256-Q5eJhcfT4QcOM1P8tjc3QfDtD2GPwKnog0kU0ujhv5Q=";
  });

  cargoHash = "sha256-4KTd1sT2TjaSzGG7qs9dxcr81IdfSqo74SePAwbIc8I=";

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
