{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "24f113dcd57f1c262133d184578b463c50af25ae";
    fetchSubmodules = true;
    sha256 = "sha256-wKTlI9XnO9+C7BHU/xeHG9Y4VpovUQy/JJ+e3T1E/EQ=";
  });

  cargoHash = "sha256-RqVwV7+WcbB3K7mgSqh5+PTwCpg2ra5ZIadxbhVsO8U=";

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
