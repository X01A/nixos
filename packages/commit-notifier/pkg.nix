{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7a369136cdabd894193c2ca7d86ffad0d9c545f5";
    fetchSubmodules = true;
    sha256 = "sha256-lyCmfttMXkzNRVeqyIgt5LiBJdPGktrujIYMcbdTpQI=";
  });

  cargoSha256 = "sha256-GPwQwGd4WylFdB/bNTRmd8ETbwFacvHwhjsWdn5hLd0=";

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
