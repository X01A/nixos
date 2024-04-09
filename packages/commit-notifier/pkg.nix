{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "56aaa0f8f78cae8708422f839e062c7fa2018d29";
    fetchSubmodules = true;
    sha256 = "sha256-diLtCvN0iImZ5tDibQ7gkVJu4Jv1SsaghD50+I/fU3o=";
  });

  cargoSha256 = "sha256-HKhGH/S3b9/w4wQDUqVapPRrby3IDhSLMbR9Ud6dhb0=";

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
