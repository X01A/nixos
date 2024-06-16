{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "92a96c7543d4bfd32724dab47b32db1251ecad22";
    fetchSubmodules = true;
    sha256 = "sha256-pU8Eb1eI1R5RhsRXyhSYCCDVT1MjW0BjI9spj1e0ItM=";
  });

  cargoSha256 = "sha256-sO8t09879sLLpxd64G6cbW0/zZqH5Nb3n3AXL7dYaE4=";

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
