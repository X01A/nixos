{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cb8b515815cb5b1e1e1005d833e296a888a57b08";
    fetchSubmodules = true;
    sha256 = "sha256-FASW2eTZ0ZxTkEEgwAVlRCSksTSdTa7BcqGXUEsnx8U=";
  });

  cargoSha256 = "sha256-VXQAb8Hd2ex6unjF1JtycnbtV3bVA/z6AL9s3Rb3j8g=";

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
