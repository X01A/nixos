{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e698cfc5306a38fa172ee1501550c3fb918596dd";
    fetchSubmodules = true;
    sha256 = "sha256-xCKQBWIy5REIZnkr22iARevfrU+04U9YDQYw2ckzDEI=";
  });

  cargoSha256 = "sha256-YUNDUu074Y1SRrcuPw6xK2FDEKeUqE2uzu7HZUr/DfQ=";

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
