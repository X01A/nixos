{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "87db02bf55f40e178b87f68860f433b2c5312251";
    fetchSubmodules = true;
    sha256 = "sha256-IBZNhoYd/McliijAjmZNlwxO55jmmI5EX8aV7kCBE9s=";
  });

  cargoSha256 = "sha256-SpPLZl5f7HYCu6kZn+K750S55I/j5vwcKw042GeKYo8=";

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
