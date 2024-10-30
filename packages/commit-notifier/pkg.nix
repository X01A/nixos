{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a594842bdf702f29849b8b1df81189e4b31d2022";
    fetchSubmodules = true;
    sha256 = "sha256-jAFhUBfNBja3esjPnK8QS9MLMsyW2MNIjt8tZKoLE+0=";
  });

  cargoHash = "sha256-G31Tiv9387s/Jyr5B5z9YBvYhmmeZNDZn8Xs+xY8xkQ=";

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
