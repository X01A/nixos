{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e638ccbe296c07780449195946d28ab8cf2ea3f1";
    fetchSubmodules = true;
    sha256 = "sha256-G8VN+vD6tQBM/JXJBaEE0L8IYjlhIALm0TTEk77jBQo=";
  });

  cargoSha256 = "sha256-KDdikNiBE6twDYcOrc+Wq2wP+3UcbFdhhOiKdb/khHg=";

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
