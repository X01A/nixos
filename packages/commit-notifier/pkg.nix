{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "71c960acdb5c34552b7c8103988baaf0123663d8";
    fetchSubmodules = true;
    sha256 = "sha256-oTZVjn5lwg8Wftvc167qNVC/ikNcTIW88G5CgFfpvUk=";
  });

  cargoSha256 = "sha256-y5EwU+MxJRSxZfnes/lq6G01ARODNhkNvtsQdoQwMFQ=";

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
