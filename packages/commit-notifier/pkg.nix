{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "12181fa1dd2588ebd9cb77eb44f1f012236ea558";
    fetchSubmodules = true;
    sha256 = "sha256-EWr+wMCUyH+8VN78OmyUbwuzv/AJsf+/JfgDQ91t+8A=";
  });

  cargoSha256 = "sha256-ZvwcELz+VRrzCTysgp/EA55INJNSvc2Qk9Ew5ZET1YE=";

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
