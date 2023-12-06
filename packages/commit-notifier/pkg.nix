{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ead5e18f131e9ab42747536958c716ebf8d34bdd";
    fetchSubmodules = true;
    sha256 = "sha256-mNmMBhap5iqEUT+tdNHv6++jsdfqyb9oJldu+qgSNl0=";
  });

  cargoSha256 = "sha256-oScio+Ik5cymRH99nD5YpIzqu91TT8BMyc7832NQNSU=";

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
