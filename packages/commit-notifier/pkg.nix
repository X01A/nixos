{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7e7063acfa5ff12d28cb7df55bf62fa7f61e6d5f";
    fetchSubmodules = true;
    sha256 = "sha256-MWqQHGG4+lKBHY1sCBxKRdJYpyGsYU5Rvmp5KsdrR9w=";
  });

  cargoSha256 = "sha256-YzakHYIsxDkl/RUG3lvxO6Yq+FBcn/rfWp/E4dP1Tck=";

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
