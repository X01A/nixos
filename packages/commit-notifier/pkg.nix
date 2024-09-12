{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7648cba1f4ef81f3e132d39ab9fb9af791f397a0";
    fetchSubmodules = true;
    sha256 = "sha256-8Bvchyp3nCo5CI7qVKe2XL4uLxChF8D/186x6bMBBTo=";
  });

  cargoSha256 = "sha256-RGEYbrrym50vdyT93KOz5pvnTmPr7ME+MW38Jsqa7m4=";

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
