{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f10fb766e5c80ce03499983e95634e12f28c338a";
    fetchSubmodules = true;
    sha256 = "sha256-0n8ZyRU5Ccz0NsKyD1n9gP3UN/7jMdqO0HpxIhWlAvs=";
  });

  cargoSha256 = "sha256-weJxAz0w0AA3a968XfIPSipVzXugTbLvkMp84zfwidY=";

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
