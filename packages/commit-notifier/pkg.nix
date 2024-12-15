{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cde619d74a8ff64e112bc731ad774ff84b014391";
    fetchSubmodules = true;
    sha256 = "sha256-uJgIqWlHcU/qonTMRsyQXoVCw2GneNu6zJK6DkzRy8U=";
  });

  cargoHash = "sha256-YmF/PEue4TybXtpg27IMHW+WUUKEGNYXD6vgekd89BQ=";

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
