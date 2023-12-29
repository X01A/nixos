{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6e246ade02fdd4269d61b12ca7d4cc3020527676";
    fetchSubmodules = true;
    sha256 = "sha256-mwqferHg/Ptdht2xSvg5mNkxCEvvb8JOl+XErN4C6AI=";
  });

  cargoSha256 = "sha256-mdUoW0BboXH9jhxgFdLmcpWCHvOvAIcEJot7HTmSqow=";

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
