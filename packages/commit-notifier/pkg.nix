{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7cd642ac538c3fad00c87200719c2826d38b7c33";
    fetchSubmodules = true;
    sha256 = "sha256-ExmyygjLXDxKpuAHFCQrKV75fs6vdFitJSbYSXWtWbw=";
  });

  cargoHash = "sha256-CKq1CrYjuYIyzvnptzUl7BqlH07isEWZcbXtnGUfpBY=";

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
