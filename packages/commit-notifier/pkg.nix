{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9635886425b6ce5082b82a2791336853c172950c";
    fetchSubmodules = true;
    sha256 = "sha256-G/VRtLstpk9Nj9i+7zVEX+G79ao8bi4dcR5D6XpUM7U=";
  });

  cargoSha256 = "sha256-bFUsT7dWBltORRqprbCpmEWtz0wHJIqoKOFASMSfIE4=";

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
