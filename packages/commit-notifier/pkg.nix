{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-05-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "313e3721ca72449287322ba985e8fe6a87b8cb7d";
    fetchSubmodules = true;
    sha256 = "sha256-fuQ+aGdvtvSUDL9OeC3ZD/21RP/9wkonXXcqvtfmuQc=";
  });

  cargoHash = "sha256-3uF0F962qn6MaNRqO2CWSCnZq6VhaBuK1Njx5mhwb1Q=";

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
