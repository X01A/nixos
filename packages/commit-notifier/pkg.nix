{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "55b5f9411004dceedf140b9033e0e42c17e9ef79";
    fetchSubmodules = true;
    sha256 = "sha256-fNSC81woBfNSmEGpM2i0SG/R3pfcAIwajVHGDz+ncmo=";
  });

  cargoSha256 = "sha256-eFRYYqKbRbOeReBSEuvBWD8O3Wob2eyqtTP3w0LWqY8=";

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
