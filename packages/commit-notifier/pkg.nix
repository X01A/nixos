{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "52cc804de8ed315f12ea6ead16334223f5e00ac6";
    fetchSubmodules = true;
    sha256 = "sha256-9WlValR5lCABS2jzobbU5rAvNMRzBMa+sYPloANUzZw=";
  });

  cargoSha256 = "sha256-lRhFzL8scf3R1/BpI+AionEjycfX/XDxHOIsyoFe7a8=";

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
