{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-10-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b605258898992b2457de99ac92a8c21db96e053a";
    fetchSubmodules = true;
    sha256 = "sha256-ud1XUWC7xZ3mKhgt4LdcgI14Ik5ySRVg3eF8SsAFOe4=";
  });

  cargoHash = "sha256-wke6gbkg3co6/vIjpqHFIPK7mapgLc0dbdzN7CmX9II=";

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
