{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6847a6ae7d6ac6de83f60184b07a631932ad1505";
    fetchSubmodules = true;
    sha256 = "sha256-KYBQBg+DakWBnWuTnV62m2DDGulkOtsyd6aStgfMWw8=";
  });

  cargoSha256 = "sha256-5hikRhiBzc4+7FeQp0jLAnCi+6D8EKiizqRi9WK8Pac=";

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
