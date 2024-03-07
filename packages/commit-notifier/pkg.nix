{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "31e9ba13914c171123ba1a3266ca07cec00e36ca";
    fetchSubmodules = true;
    sha256 = "sha256-xmkvoe49IP1L3OuE45HHQM51XMDdx8xo6UPKBwJJUTk=";
  });

  cargoSha256 = "sha256-oYfwETI3x2nKtsOzK6ChkYSjNYrtXq3SBhsKCHUVnPs=";

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
