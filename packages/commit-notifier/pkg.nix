{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "92205fa9349f0cda1cc626545d55a2c3024f7ee9";
    fetchSubmodules = true;
    sha256 = "sha256-3eXUBxA3otC4EOmDrWmkvYtOCN+kcBvZM8dRIgwS+34=";
  });

  cargoSha256 = "sha256-YoqUs9nO0R8sN3kq1R93jNVPTWBFjyvWvqZxzUNpTFc=";

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
