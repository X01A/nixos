{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "988a94f495b76f550456e682f238c3352aab85bc";
    fetchSubmodules = true;
    sha256 = "sha256-r8m3F22HYZoI1A0PAucgxtTsWZuQmIEO/MDgZsvu2uw=";
  });

  cargoSha256 = "sha256-XgYy/lFiFXwGcVU8Bkjy7gp2kZuce0obiiyVAbHRfQc=";

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
