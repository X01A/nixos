{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c509cf8b84fea7f82e99d8aece26da08c8df2e63";
    fetchSubmodules = true;
    sha256 = "sha256-xA9wI168y+7Y6ZzmldHbGuP1CeaZrn35hxSKGaaopiw=";
  });

  cargoSha256 = "sha256-bKV09zYHooMWhQexUmqZO00Lk8f8cyj01AALYNMkKHg=";

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
