{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "87d62b27a9672c2d0430229c79b8f3410b3971bf";
    fetchSubmodules = true;
    sha256 = "sha256-xm7To1wGqyWQiZ/XxNerOoyTbk+hkkEEuHygPuSE4KI=";
  });

  cargoSha256 = "sha256-k9NGwKD2lFs2HNKhKiuTUFULMSPx3LKLtNcnKoiZz64=";

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
