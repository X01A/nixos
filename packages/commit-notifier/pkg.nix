{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f15ea52ff9853df7f8de97d2c2342f2ea7ca68da";
    fetchSubmodules = true;
    sha256 = "sha256-TgdATkdC62W7wyPteOOKwJT4oe+kB1QSoKSPOYKHdsk=";
  });

  cargoSha256 = "sha256-NjO1m1jwzezOH+4EDAKWvWY5QZ/7hpdlFxQwn6qd0Ig=";

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
