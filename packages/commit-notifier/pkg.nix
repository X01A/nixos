{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8b4533157d0b020c866d3beee577ccde33640581";
    fetchSubmodules = true;
    sha256 = "sha256-/lZ1KLr8G4m80K2nQD1ukIfBdcbxXeXc+C2OcTfMZmg=";
  });

  cargoSha256 = "sha256-giA888iUtqYvaCJqA3EU98GV4sIOv6jZ7SJ42Rhye9I=";

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
