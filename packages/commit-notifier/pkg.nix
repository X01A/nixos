{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ccc5ba0633d6f0d507ba6881c2805d04e00bca39";
    fetchSubmodules = true;
    sha256 = "sha256-wNhGyE8+ankBzlR8XRAxOtTakNVTnp1BOCXScPugJgY=";
  });

  cargoSha256 = "sha256-AiBAl78Ck2eY7CRR4XSk95+Y2qylwJrMHpFXXfkB71Q=";

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
