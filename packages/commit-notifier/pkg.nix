{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d97f36faa69b7c25221f1e0dc03ed05bc215bea2";
    fetchSubmodules = true;
    sha256 = "sha256-OTj09Jrl+3laq5PW+0aIKRtHeajz5oBPBLcTJiYy8hY=";
  });

  cargoSha256 = "sha256-YeeJ3J4Uc7d7YDz2fmGUEnDxQwV+98qiqROUWhzZUPk=";

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
