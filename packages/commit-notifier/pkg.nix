{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-01-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "480acf70e9d5501ce0d4c71ddf3e80c75cb5def7";
    fetchSubmodules = true;
    sha256 = "sha256-Xte9pIfRgd8a/IjWIKXI7i6Q/jiv6w+bspA9g4V3F1c=";
  });

  cargoHash = "sha256-p92jDO/sveIDgtfJF2vlAsfoP6GspsxOAcoMkukXRt4=";

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
