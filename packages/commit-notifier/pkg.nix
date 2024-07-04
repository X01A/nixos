{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "abe2a50b7a4cc0295199e523b3c4df7b77b65ca6";
    fetchSubmodules = true;
    sha256 = "sha256-srwJ8NK1DLoimQfJQ4MHeYwUy5F9RpafWI2mSLbeIFo=";
  });

  cargoSha256 = "sha256-fkY2lQaKAgtgUsTVcs63av6CBfGzF2l22Fpe5b67hHk=";

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
