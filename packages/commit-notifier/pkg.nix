{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "34e8153ec01fccc6c0ee82e8c01a5571cb450779";
    fetchSubmodules = true;
    sha256 = "sha256-iwdYOmZV92paUp0HvSi9hGiRZN1K52w/Au7M/qMedOM=";
  });

  cargoSha256 = "sha256-T4UxoToSDQTbr8nWR8A0kVWMt2M/4MkmGaDYF2/vdIE=";

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
