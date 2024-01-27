{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b466031166ffd3d15a0c9b1d40317ad28b0494de";
    fetchSubmodules = true;
    sha256 = "sha256-kpyGrnGNNmZ28ReveU8xUmk30q4JTLMs3GM8MvCxyPk=";
  });

  cargoSha256 = "sha256-rd/07oeGib03unsPecvIYHIH7PlzKernEvD7qB3wQgM=";

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
