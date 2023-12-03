{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "04bf60151df1218fa536464252ae505d77614593";
    fetchSubmodules = true;
    sha256 = "sha256-akQnbi5NBbN2c46d8fO7LL5lvlFMYxIpmcVcKHeDNBQ=";
  });

  cargoSha256 = "sha256-fpwApd2Q0stBTB+uzKmuJhD7LuFOXlFPMeUQ+ExL9e8=";

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
