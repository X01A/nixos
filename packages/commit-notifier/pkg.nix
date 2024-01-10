{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1dc8b9b0f640d36badac005acc226f8b8499671f";
    fetchSubmodules = true;
    sha256 = "sha256-a8+m3XaeqqsnrG6HWiXc0+TfpQ4K9E0XaH0CtD1u5ho=";
  });

  cargoSha256 = "sha256-7ihOck2ABhABiWu6a2oGFjuBuKdksjRsqsaf50ZJexc=";

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
