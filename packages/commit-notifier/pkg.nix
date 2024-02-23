{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5a42dc3377ce05f9a673b5665d55dc0e1bc26838";
    fetchSubmodules = true;
    sha256 = "sha256-ewzmf/4N4+ItC0VTKbfr3Tox187pGpqq5xpTiMw4cU8=";
  });

  cargoSha256 = "sha256-CZarZ+AXanOLaSENr+ePSEScfJxlr+W/yiwu2WLpAeM=";

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
