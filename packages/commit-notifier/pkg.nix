{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3747c11aba7f59f2e56c15b9b34f12b0ec945c01";
    fetchSubmodules = true;
    sha256 = "sha256-ER8bSOW78VOcFfdIzYMGvz3R0eHg5jha9bCsOTUge8U=";
  });

  cargoSha256 = "sha256-jsP6u9DvH2JU+zLwdAQFsYtkeJ7+BsbsPXCRSMdmyMg=";

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
