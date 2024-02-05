{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "954a71203acb624222c95eaa77012feef593ef76";
    fetchSubmodules = true;
    sha256 = "sha256-dPZk5e7kTenkPB9s9Jfpwu8+BdcuuXzMlrKM3FDlB+M=";
  });

  cargoSha256 = "sha256-217zbVo5GMR7BfBPTvzz8v4d1dmWlInb1EvgSBsgKMc=";

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
