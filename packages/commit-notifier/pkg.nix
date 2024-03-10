{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "49807634997ba5a025c65d2b13ac01fde7d9a9fd";
    fetchSubmodules = true;
    sha256 = "sha256-iwEUFXxcPKXWAJinr7c+KQN0BpcpTHtfFDdnPdcBbkg=";
  });

  cargoSha256 = "sha256-AS3GqJHek51fUiXz/pdFCk9qSahMt8tMS33QHZjkv1k=";

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
