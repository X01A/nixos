{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9e47b331333dfe8d126db0c5b81592eac4043e72";
    fetchSubmodules = true;
    sha256 = "sha256-73xL1eG+8z+0Yucmy149mhlH1aasE6o9Rm1fyrXtvo8=";
  });

  cargoHash = "sha256-sSQcvVnxsvCjQMl4EqZVT/cIPqrL2Qd4/vDpGQslg8s=";

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
