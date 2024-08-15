{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b2fcebc58b691db567cf274cae5ff9ac9a424c6a";
    fetchSubmodules = true;
    sha256 = "sha256-nrgNiAf+iuKetiCzCK78OU2iBgjaY5gdDXA+wclsEG4=";
  });

  cargoSha256 = "sha256-OtpCVf03Ahuzf3DlSPCfX5HHS00vaQaQWDELpZdfRtc=";

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
