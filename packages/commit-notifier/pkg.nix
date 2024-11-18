{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "01a29763f22333ce17221cfaff6a863e4ca33eb8";
    fetchSubmodules = true;
    sha256 = "sha256-XtDUMZ0D/vps+ENxmZJr3lTtsNvTK2hb6Ww2sH11Rgw=";
  });

  cargoHash = "sha256-McHhTwd1KU4lw7miBbKEbHsccWFitrpvrEc6csqW8FI=";

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
