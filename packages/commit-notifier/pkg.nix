{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fdbc6dba5841630b87c2f693462bc6ec890a2aa2";
    fetchSubmodules = true;
    sha256 = "sha256-eQPBnHFLSQ40rjULmIBwZ3/jMyBMrhrotCb7SsScw8s=";
  });

  cargoHash = "sha256-atV0BG7IC7S34jyv3eggavcXe4NwxjsOyHpyQXeZqDc=";

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
