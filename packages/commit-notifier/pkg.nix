{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "519f82cc514a1a8b93a6ea92988c9780f226891f";
    fetchSubmodules = true;
    sha256 = "sha256-RFmwzOkLb1rNGDs4QsMNGzH52umdZthffSq60sc39NI=";
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
