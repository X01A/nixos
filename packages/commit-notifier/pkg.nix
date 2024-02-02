{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "545b738b7d68da84ca582763d174f7804fc6de6f";
    fetchSubmodules = true;
    sha256 = "sha256-rO/S4u9Eu0rVD94PBQluH3KTYmnPvjxMJegEfw2g/Bw=";
  });

  cargoSha256 = "sha256-RycIJZ6cB1mFlr0fIe4A3OVxZV3H2ZWkIUKIEA0i0Sk=";

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
