{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dd61e7f02e490d17b1013500df18391c9df4a31b";
    fetchSubmodules = true;
    sha256 = "sha256-8fpRzpbKXeFOCWbhWgLb4ioLsbh3kmRyHb89wLEYFTA=";
  });

  cargoSha256 = "sha256-Ra14sQDpkl//7YvlggAOKKj8b1rGrcGRhs7U10GZO3c=";

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
