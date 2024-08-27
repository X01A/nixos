{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0af776b6b582a1e848498c8596815d0ed67419e5";
    fetchSubmodules = true;
    sha256 = "sha256-DoltTKG5ugL5scAiK5RR9SFMRj1Balgn+e+d9WeXapw=";
  });

  cargoSha256 = "sha256-QxXWSJ/Hvm7oAPDROzMhpQw4/yKnw1uQ5KQ4IhPsFs4=";

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
