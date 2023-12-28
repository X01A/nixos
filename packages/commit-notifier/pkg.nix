{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "17399a38849d3ea6bb92ea4f2eb5aee835a05c79";
    fetchSubmodules = true;
    sha256 = "sha256-oZ3x+tjOwm+1guhVraN6G1bLfA3VWzomymalxc1hT1A=";
  });

  cargoSha256 = "sha256-68KB9eXL6A1Uh6sIevtQfkojtqlPJgLQmRWzr9koaWA=";

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
