{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f81501b0a221be425bf9f5a16570cb53542a118a";
    fetchSubmodules = true;
    sha256 = "sha256-s2L4YJLydN2YJ6/F0xdp4oL9iIYLoqLAuzndcAHN+vc=";
  });

  cargoSha256 = "sha256-o75lQHb9GLLVCTj/2VUPwe8S8Y1+mdscumw83AMxpvE=";

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
